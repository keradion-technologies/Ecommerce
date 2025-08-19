<?php

namespace App\Http\Services\Admin;

use App\Http\Controllers\Controller;
use App\Models\Tutorial;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class TutorialService extends Controller
{
     /**
      * Summary of index
      * @param string|null $audience
      * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
      */
     public function index(string|null $audience = null): View{
          
          $title = translate("Manage tutorials - ").translate(ucfirst(strtolower($audience ?? '')));
          $tutorials = Tutorial::when($audience, 
                                   fn(Builder $q): Builder =>
                                        $q->where('audience', $audience))
                              ->date()
                              ->search(["title"])
                              ->filter(["status"])
                              ->latest("id")
                              ->paginate(site_settings('pagination_number', 10));

          return view('admin.seller.tutorial.index', compact('title', 'tutorials'));
     }

     /**
      * Summary of save (Create or Update)
      * @param string|null $audience
      * @param array|null $data
      * @param string|null $identifier
      * @return RedirectResponse
      */
     public function save(string|null $audience = null, array|null $data = null, string|null $identifier = null): RedirectResponse {

          DB::transaction(function () use ($audience, $data, $identifier) {
               
               $tutorialData = [
                    'title'        => Arr::get($data, "title"),
                    'description'  => Arr::get($data, "description"),
                    'status'       => Arr::get($data, "status"),
               ];

               $tutorial = Tutorial::updateOrCreate(
                    ['uid' => $identifier], 
                    $tutorialData
               );

               if (!empty($data['files']) || $identifier) {
                    $this->handleFiles($tutorial, $data, $audience, $identifier);
               }
          });

          $message = $identifier ? translate("Tutorial updated successfully") : translate("Tutorial created successfully");
          return redirect()->route('admin.seller.tutorial.index')->with('success', $message);
     }

     /**
      * Handle file operations for tutorial
      * @param Tutorial $tutorial
      * @param array $data
      * @param string $audience
      * @param string|null $identifier
      * @return void
      */
     private function handleFiles(Tutorial $tutorial, array $data, string $audience, ?string $identifier = null): void
     {
          $fileService = app(FileService::class);
          $location = file_path()['tutorials'][$audience]['path'];
          $newFiles = Arr::get($data, 'files', []);
          
          if ($identifier) {

               $existingFiles = $tutorial->files ?? [];
               $deletedFiles = !empty($data['deleted_files']) ? json_decode($data['deleted_files'], true) : [];
               
               if (!empty($deletedFiles)) {
                    $existingFiles = array_filter($existingFiles, function($file) use ($deletedFiles) {
                         return !in_array($file, $deletedFiles);
                    });
                    
                    $fileService->deleteFiles($deletedFiles, $location);
               }
               
               $uploadedFiles = [];
               if (!empty($newFiles)) {
                    $uploadedFiles = $fileService->uploadFiles(
                         files: $newFiles,
                         location: $location,
                         returnLinks: true,
                         existingFiles: $existingFiles
                    );
               }
               
               $finalFiles = array_merge(array_values($existingFiles), $uploadedFiles ?? []);
               $tutorial->update(['files' => $finalFiles]);
               
          } else {
               if (!empty($newFiles)) {
                    $storedFiles = $fileService->uploadFiles(
                         files: $newFiles,
                         location: $location,
                         returnLinks: true
                    );
                    $tutorial->update(['files' => $storedFiles]);
               }
          }
     }

     /**
      * Delete tutorial and associated files
      * @param string $identifier
      * @param string $audience
      * @return RedirectResponse
      */
     public function destroy(string $identifier, string $audience): RedirectResponse
     {
          DB::transaction(function () use ($identifier, $audience) {
               $tutorial = Tutorial::where('uid', $identifier)->firstOrFail();
               
               // Delete associated files from filesystem
               if ($tutorial->files && count($tutorial->files) > 0) {
                    $fileService = app(FileService::class);
                    $location = file_path()['tutorials'][$audience]['path'];
                    $fileService->deleteFiles($tutorial->files, $location);
               }
               
               // Delete tutorial record
               $tutorial->delete();
          });

          return redirect()->route('admin.seller.tutorial.index')->with('success', translate("Tutorial deleted successfully"));
     }
}