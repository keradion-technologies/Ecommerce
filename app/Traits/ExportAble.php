<?php

namespace App\Traits;

use Illuminate\Database\Eloquent\Model;

trait ExportAble
{




    /**
     * Summary of csvExport
     * @param string $model
     * @param string $fileNamePrefix
     * @param array $fileHeader
     * @param array $pluckableKey
     * @return \Symfony\Component\HttpFoundation\StreamedResponse
     */
    public function csvExport(string $model,  string $fileNamePrefix, array $fileHeader, array $pluckableKeys, array $condition = []): \Symfony\Component\HttpFoundation\StreamedResponse
    {



        $fileName = $fileNamePrefix . '_data_export_' . date('Y_m_d_H_i_s') . '.csv';

        $headers = array(
            "Content-type" => "text/csv",
            "Content-Disposition" => "attachment; filename=$fileName",
            "Pragma" => "no-cache",
            "Cache-Control" => "must-revalidate, post-check=0, pre-check=0",
            "Expires" => "0"
        );



        $callback = function () use ($fileHeader, $model, $condition, $pluckableKeys): void {

            $file = fopen(filename: 'php://output', mode: 'w');

            fputcsv(stream: $file, fields: $fileHeader);

            $modelInstance = app(config('constants.options.model_namespace') . $model);

            // Apply conditions if $condition is not empty
            if (!empty($condition)) {
                foreach ($condition as $key => $value) {
                    $modelInstance = $modelInstance->where($key, $value);
                }
            }


            $modelInstance->chunk(count: 1000, callback: function ($data) use ($file, $pluckableKeys): void {
                foreach ($data as $row) {
                    $fields = [];
                    foreach ($pluckableKeys as $key) {

                        if (is_array($key)) {

                            $fields[] = $this->pluckRelationalField($row, $key);

                        } else {
                            // Handle normal fields
                            $fields[] = $row->{$key};
                        }
                    }

                    fputcsv(stream: $file, fields: $fields);
                }
            });

            fclose(stream: $file);
        };


        return response()->stream($callback, 200, $headers);


    }



    private function pluckRelationalField($row, array $key)
    {
        $relation = $row;

        foreach ($key as $attribute) {
            // Navigate through each level of the relation
            $relation = $relation->{$attribute} ?? null;

            // Return 'N/A' if any level is null
            if ($relation === null) {
                return 'N/A';
            }
        }

        return $relation;
    }


}
