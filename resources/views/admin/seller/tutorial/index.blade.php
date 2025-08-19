@extends('admin.layouts.app')

@push('style-push')
<style>
.file-preview-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 10px;
}

.file-preview-item {
    position: relative;
    border: 2px dashed #ddd;
    border-radius: 8px;
    padding: 10px;
    width: 120px;
    height: 120px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: #f8f9fa;
    transition: all 0.3s ease;
}

.file-preview-item:hover {
    border-color: #007bff;
    background: #f0f8ff;
}

.file-preview-item img {
    max-width: 80px;
    max-height: 80px;
    object-fit: cover;
    border-radius: 4px;
}

.file-preview-item .file-icon {
    font-size: 40px;
    color: #6c757d;
    margin-bottom: 5px;
}

.file-preview-item .file-name {
    font-size: 10px;
    text-align: center;
    color: #6c757d;
    word-break: break-all;
    margin-top: 5px;
}

.file-delete-btn {
    position: absolute;
    top: -8px;
    right: -8px;
    background: #dc3545;
    color: white;
    border: none;
    border-radius: 50%;
    width: 20px;
    height: 20px;
    font-size: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    z-index: 10;
}

.file-delete-btn:hover {
    background: #c82333;
}

.new-files-container {
    margin-top: 15px;
    padding-top: 15px;
    border-top: 1px solid #dee2e6;
}

.hidden {
    display: none !important;
}
</style>
@endpush

@section('main_content')
    <div class="page-content">
        <div class="container-fluid">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0">{{translate($title)}}</h4>
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{translate('Dashboard')}}</a></li>
                        <li class="breadcrumb-item active">{{translate('Tutorials')}}</li>
                    </ol>
                </div>
            </div>

            <div class="card" id="tutorialList">
                <div class="card-header border-0">
                    <div class="row g-4 align-items-center">
                        <div class="col-sm">
                            <h5 class="card-title mb-0">{{translate('Tutorial List')}}</h5>
                        </div>
                        <div class="col-sm-auto">
                            <button class="btn btn-success btn-sm w-100 add-btn waves ripple-light" data-bs-toggle="modal" data-bs-target="#addTutorial">
                                <i class="ri-add-line align-bottom me-1"></i>{{translate('Add Tutorial')}}
                            </button>
                        </div>
                    </div>
                </div>

                <div class="card-body border border-dashed border-end-0 border-start-0">
                    <form action="{{route('admin.seller.tutorial.index')}}" method="get">
                        <div class="row g-3">
                            <div class="col-xl-4 col-sm-6">
                                <div class="search-box">
                                    <input type="text" value="{{request()->input('search')}}" name="search" class="form-control search" placeholder="{{translate('Search by title or description')}}">
                                    <i class="ri-search-line search-icon"></i>
                                </div>
                            </div>
                            <div class="col-xl-2 col-sm-3 col-6">
                                <button type="submit" class="btn btn-primary w-100 waves ripple-light">
                                    <i class="ri-equalizer-fill me-1 align-bottom"></i>{{translate('Search')}}
                                </button>
                            </div>
                            <div class="col-xl-2 col-sm-3 col-6">
                                <a href="{{route('admin.seller.tutorial.index')}}" class="btn btn-danger w-100 waves ripple-light">
                                    <i class="ri-refresh-line me-1 align-bottom"></i>{{translate('Reset')}}
                                </a>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="card-body">
                    <div class="table-responsive table-card">
                        <table class="table table-hover align-middle table-nowrap mb-0">
                            <thead class="text-muted table-light">
                                <tr class="text-uppercase">
                                    <th>{{translate('Title')}}</th>
                                    <th>{{translate('Files')}}</th>
                                    <th>{{translate('Status')}}</th>
                                    <th>{{translate('Action')}}</th>
                                </tr>
                            </thead>
                            <tbody class="list form-check-all">
                                @forelse($tutorials as $tutorial)
                                    <tr>
                                        <td data-label="{{translate('Title')}}">
                                            <span class="fw-bold">{{ $tutorial->title }}</span>
                                        </td>
                                        <td data-label="{{translate('Files')}}">
                                            @if($tutorial->files && count($tutorial->files))
                                                <span class="badge badge-soft-primary">{{ count($tutorial->files) }} {{translate('Files')}}</span>
                                            @else
                                                <span class="badge badge-soft-danger">{{translate('No Files')}}</span>
                                            @endif
                                        </td>
                                        <td data-label="{{translate('Status')}}">
                                            @if($tutorial->status == \App\Enums\StatusEnum::true->status())
                                                <span class="badge badge-soft-success">{{translate('Active')}}</span>
                                            @else
                                                <span class="badge badge-soft-danger">{{translate('Inactive')}}</span>
                                            @endif
                                        </td>
                                        <td data-label="{{translate('Action')}}">
                                            <div class="hstack justify-content-center gap-3">
                                                <a title="{{translate('Update')}}" href="javascript:void(0)"
                                                   data-id="{{ $tutorial->id }}"
                                                   data-uid="{{ $tutorial->uid }}"
                                                   data-title="{{ $tutorial->title }}"
                                                   data-description="{{ $tutorial->description }}"
                                                   data-status="{{ $tutorial->status }}"
                                                   data-files="{{ json_encode($tutorial->files) }}"
                                                   class="tutorial fs-18 link-warning">
                                                    <i class="ri-pencil-fill"></i>
                                                </a>
                                                <a href="javascript:void(0);" title="{{translate('Delete')}}"
                                                   data-bs-toggle="tooltip" data-bs-placement="top"
                                                   data-href="{{ route('admin.seller.tutorial.destroy', $tutorial->uid) }}"
                                                   class="delete-item fs-18 link-danger">
                                                    <i class="ri-delete-bin-line"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="border-bottom-0" colspan="100">
                                            @include('admin.partials.not_found')
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <div class="pagination-wrapper d-flex justify-content-end mt-4">
                        {{ $tutorials->appends(request()->all())->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade zoomIn" id="deleteModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" id="deleteRecord-close"
                    data-bs-dismiss="modal" aria-label="Close" id="btn-close"></button>
            </div>
            <div class="modal-body">
                <div class="mt-2 text-center">
                    <lord-icon src="{{asset('assets/global/gsqxdxog.json')}}" trigger="loop"
                        colors="primary:#f7b84b,secondary:#f06548"
                        class="loader-icon">
                    </lord-icon>
                    <div class="mt-4 pt-2 fs-15 mx-4 mx-sm-5">
                        <h4>
                           {{translate('Are you sure ?')}}
                        </h4>
                        <p class="text-muted mx-4 mb-0">
                            {{translate('Are you sure you want to remove this record ?')}}
                        </p>
                    </div>
                </div>
                <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                    <button type="button" class="btn w-sm btn-secondary"
                        data-bs-dismiss="modal">
                        {{translate('Close')}}
                    </button>
                    <form id="deleteForm" method="POST" style="display: inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn w-sm btn-danger">
                            {{translate('Yes, Delete It!')}}
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

    <div class="modal fade" id="addTutorial" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addTutorial" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-light p-3">
                    <h5 class="modal-title">{{translate('Add New Tutorial')}}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="{{route('admin.seller.tutorial.store')}}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="title" class="form-label">{{translate('Title')}} <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="title" name="title" placeholder="{{translate('Enter title')}}" required>
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">{{translate('Description')}} <span class="text-danger">*</span></label>
                            <textarea class="form-control" id="description" name="description" placeholder="{{translate('Enter description')}}" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="files" class="form-label">{{translate('Files')}}</label>
                            <input type="file" class="form-control" id="files" name="files[]" multiple>
                        </div>
                        <div class="mb-3">
                            <label for="status" class="form-label">{{translate('Status')}} <span class="text-danger">*</span></label>
                            <select class="form-select" name="status" id="status" required>
                                @foreach (\App\Enums\StatusEnum::toArray() as $label => $value)
                                    <option value="{{ $value }}" {{ old('status') == $value ? 'selected' : '' }}>
                                        {{ translate($label) }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer px-0 pb-0 pt-3">
                        <div class="hstack gap-2 justify-content-end">
                            <button type="button" class="btn btn-danger waves ripple-light" data-bs-dismiss="modal">{{translate('Close')}}</button>
                            <button type="submit" class="btn btn-success waves ripple-light">{{translate('Add Tutorial')}}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="updateTutorial" tabindex="-1" aria-labelledby="updateTutorial" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-light p-3">
                    <h5 class="modal-title">{{translate('Update Tutorial')}}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="" method="POST" enctype="multipart/form-data" id="updateTutorialForm">
                    @csrf
                    @method('PATCH')
                    <input type="hidden" name="uid" id="tutorial_uid">
                    <input type="hidden" name="deleted_files" id="deleted_files" value="">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="utitle" class="form-label">{{translate('Title')}} <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="utitle" name="title" placeholder="{{translate('Enter title')}}" required>
                        </div>
                        <div class="mb-3">
                            <label for="udescription" class="form-label">{{translate('Description')}} <span class="text-danger">*</span></label>
                            <textarea class="form-control" id="udescription" name="description" placeholder="{{translate('Enter description')}}" required></textarea>
                        </div>
                        
                        <!-- Existing Files Preview -->
                        <div class="mb-3">
                            <label class="form-label">{{translate('Current Files')}}</label>
                            <div id="existing-files-container" class="file-preview-container">
                                <!-- Existing files will be populated here -->
                            </div>
                        </div>

                        <!-- New Files Input -->
                        <div class="mb-3 new-files-container">
                            <label for="ufiles" class="form-label">{{translate('Add New Files')}}</label>
                            <input type="file" class="form-control" id="ufiles" name="files[]" multiple>
                            <div id="new-files-preview" class="file-preview-container">
                                <!-- New file previews will be shown here -->
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="ustatus" class="form-label">{{translate('Status')}} <span class="text-danger">*</span></label>
                            <select class="form-select" name="status" id="ustatus" required>
                                @foreach (\App\Enums\StatusEnum::toArray() as $label => $value)
                                    <option value="{{ $value }}">
                                        {{ translate($label) }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="hstack gap-2 justify-content-end">
                            <button type="button" class="btn btn-danger waves ripple-light" data-bs-dismiss="modal">{{translate('Close')}}</button>
                            <button type="submit" class="btn btn-success waves ripple-light">{{translate('Update Tutorial')}}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('script-push')
<script>
(function ($) {
    "use strict";
    
    let deletedFiles = [];
    
    // Helper function to get file extension
    function getFileExtension(filename) {
        return filename.split('.').pop().toLowerCase();
    }
    
    // Helper function to check if file is image
    function isImageFile(filename) {
        const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg'];
        return imageExtensions.includes(getFileExtension(filename));
    }
    
    // Helper function to get file icon
    function getFileIcon(filename) {
        const ext = getFileExtension(filename);
        const icons = {
            'pdf': 'ri-file-pdf-line',
            'doc': 'ri-file-word-line',
            'docx': 'ri-file-word-line',
            'xls': 'ri-file-excel-line',
            'xlsx': 'ri-file-excel-line',
            'txt': 'ri-file-text-line',
            'zip': 'ri-file-zip-line',
            'rar': 'ri-file-zip-line'
        };
        return icons[ext] || 'ri-file-line';
    }
    
    // Helper function to extract filename from URL
    function getFilenameFromUrl(url) {
        return url.split('/').pop();
    }
    
    // Function to create file preview item
    function createFilePreviewItem(file, isExisting = false, fileUrl = null) {
        const filename = isExisting ? getFilenameFromUrl(fileUrl) : file.name;
        const isImage = isImageFile(filename);
        
        let previewHtml = '';
        
        if (isImage) {
            if (isExisting) {
                previewHtml = `<img src="${fileUrl}" alt="${filename}">`;
            } else {
                // For new files, create a FileReader to show preview
                const reader = new FileReader();
                const imgElement = `<img id="preview-${Date.now()}" alt="${filename}" style="display:none;">`;
                previewHtml = imgElement;
                
                reader.onload = function(e) {
                    $(`#preview-${Date.now()}`).attr('src', e.target.result).show();
                };
                reader.readAsDataURL(file);
            }
        } else {
            previewHtml = `<i class="file-icon ${getFileIcon(filename)}"></i>`;
        }
        
        return `
            <div class="file-preview-item" data-file-url="${isExisting ? fileUrl : ''}" data-is-existing="${isExisting}">
                <button type="button" class="file-delete-btn" onclick="removeFilePreview(this, '${isExisting ? fileUrl : ''}', ${isExisting})">
                    <i class="ri-close-line"></i>
                </button>
                ${previewHtml}
                <div class="file-name">${filename}</div>
            </div>
        `;
    }
    
    // Function to remove file preview
    window.removeFilePreview = function(button, fileUrl, isExisting) {
        if (isExisting) {
            // Add to deleted files array
            if (!deletedFiles.includes(fileUrl)) {
                deletedFiles.push(fileUrl);
                $('#deleted_files').val(JSON.stringify(deletedFiles));
            }
        }
        $(button).closest('.file-preview-item').remove();
    };
    
    // Tutorial update modal handler
    $('.tutorial').on('click', function () {
        const modal = $('#updateTutorial');
        const uid = $(this).data('uid');
        const files = $(this).data('files') || [];
        
        // Reset deleted files
        deletedFiles = [];
        $('#deleted_files').val('');
        
        // Populate form fields
        modal.find('#tutorial_uid').val(uid);
        modal.find('input[name=title]').val($(this).data('title'));
        modal.find('textarea[name=description]').val($(this).data('description'));
        modal.find('select[name=status]').val($(this).data('status'));
        
        // Set form action
        modal.find('form').attr('action', '{{route("admin.seller.tutorial.update", ":uid")}}'.replace(':uid', uid));
        
        // Clear existing file previews
        $('#existing-files-container').empty();
        $('#new-files-preview').empty();
        
        // Populate existing files
        if (files && files.length > 0) {
            files.forEach(function(fileUrl) {
                const previewItem = createFilePreviewItem(null, true, fileUrl);
                $('#existing-files-container').append(previewItem);
            });
        } else {
            $('#existing-files-container').html('<p class="text-muted">{{translate("No existing files")}}</p>');
        }
        
        modal.modal('show');
    });
    
    // New files preview handler
    $('#ufiles').on('change', function() {
        const files = this.files;
        $('#new-files-preview').empty();
        
        if (files.length > 0) {
            Array.from(files).forEach(function(file) {
                const previewItem = createFilePreviewItem(file, false);
                $('#new-files-preview').append(previewItem);
            });
        }
    });
    
    // Delete item handler
    $(".delete-item").on("click", function () {
        var modal = $("#deleteModal");
        modal.find('#deleteForm').attr('action', $(this).data('href'));
        modal.modal('show');
    });
    
    // Modal close handler - reset form
    $('#updateTutorial').on('hidden.bs.modal', function () {
        deletedFiles = [];
        $('#deleted_files').val('');
        $('#existing-files-container').empty();
        $('#new-files-preview').empty();
        $('#ufiles').val('');
    });
    
})(jQuery);
</script>
@endpush