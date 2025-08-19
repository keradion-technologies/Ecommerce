<?php

namespace App\Http\Services\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Image;

class FileService extends Controller
{
     /**
      * Enhanced upload files method with comparison and cleanup
      * @param mixed $files - New files to upload
      * @param string $location - Directory path where files are stored
      * @param bool $returnLinks - Whether to return full URLs or just filenames
      * @param mixed $existingFiles - Existing files from database (optional)
      * @return array|null
      */
     public function uploadFiles(mixed $files, string $location, bool $returnLinks = true, mixed $existingFiles = null): array|null
     {
          if (!$files) return null;
          $files = is_array($files) ? $files : [$files];
          
          if (!file_exists($location)) {
               mkdir($location, 0755, true);
          }

          $uploadedFiles = [];
          
          if (!empty($files)) {
               $uploadedFiles = collect($files)->map(function ($file) use ($location, $returnLinks) {
                    $filename = uniqid() . time() . '.' . $file->getClientOriginalExtension();

                    if (str_starts_with($file->getMimeType(), 'image/')) {
                         Image::make(file_get_contents($file))->save($location . '/' . $filename);
                    } else {
                         $file->move($location, $filename);
                    }

                    return $returnLinks
                         ? url($location . '/' . $filename)
                         : $filename;
               })->toArray();
          }

          return $uploadedFiles;
     }

     /**
      * Delete files from filesystem
      * @param mixed $files - Files to delete (can be URLs, filenames, or mixed array)
      * @param string $location - Directory path where files are stored
      * @return bool
      */
     public function deleteFiles(mixed $files, string $location): bool
     {
          if (!$files) return true;
          
          $files = is_array($files) ? $files : [$files];
          
          $deletedCount = 0;
          $totalFiles = count($files);
          
          foreach ($files as $file) {
               $filename = '';
               
               if (filter_var($file, FILTER_VALIDATE_URL)) {
                    $filename = basename(parse_url($file, PHP_URL_PATH));
               } else {
                    $filename = basename($file);
               }
               
               $filePath = $location . '/' . $filename;
               
               if (File::exists($filePath)) {
                    if (File::delete($filePath)) {
                         $deletedCount++;
                    }
               } else {
                    $deletedCount++;
               }
          }
          
          return $deletedCount === $totalFiles;
     }

     /**
      * Merge existing files with new files, handling the comparison logic
      * @param mixed $existingFiles - Files from database
      * @param array $newFiles - Newly uploaded files
      * @param mixed $dataFiles - Files from request data (for comparison)
      * @param string $location - Directory path
      * @param bool $returnLinks - Whether to return URLs or filenames
      * @return array
      */
     public function mergeFiles(mixed $existingFiles, array $newFiles, mixed $dataFiles, string $location, bool $returnLinks = true): array
     {
          if (!$existingFiles) {
               return $newFiles;
          }
          
          $existingFiles = is_array($existingFiles) ? $existingFiles : [$existingFiles];
          $dataFiles = is_array($dataFiles) ? $dataFiles : [$dataFiles];
          
          $existingFilenames = collect($existingFiles)->map(function ($file) use ($returnLinks) {
               if ($returnLinks && filter_var($file, FILTER_VALIDATE_URL)) {
                    return basename(parse_url($file, PHP_URL_PATH));
               }
               return basename($file);
          })->toArray();
          
          $dataFilenames = collect($dataFiles)->map(function ($file) {
               if (is_string($file) && filter_var($file, FILTER_VALIDATE_URL)) {
                    return basename(parse_url($file, PHP_URL_PATH));
               }
               return is_string($file) ? basename($file) : null;
          })->filter()->toArray();
          
          $filesToDelete = array_diff($existingFilenames, $dataFilenames);
          
          foreach ($filesToDelete as $filename) {
               $filePath = $location . '/' . $filename;
               if (File::exists($filePath)) {
                    File::delete($filePath);
               }
          }
          
          $keptFiles = collect($existingFiles)->filter(function ($file) use ($dataFilenames, $returnLinks) {
               $filename = $returnLinks && filter_var($file, FILTER_VALIDATE_URL) 
                    ? basename(parse_url($file, PHP_URL_PATH))
                    : basename($file);
               return in_array($filename, $dataFilenames);
          })->values()->toArray();
          
          return array_merge($keptFiles, $newFiles);
     }
}