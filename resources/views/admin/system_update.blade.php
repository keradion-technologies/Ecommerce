@extends('admin.layouts.app')
@push('style-push')
<style>
    .nav-tabs .nav-link {
        border: 1px solid #dee2e6;
        color: #6c757d;
        background-color: #f8f9fa;
    }
    
    .nav-tabs .nav-link.active {
        background-color: #fff;
        border-color: #dee2e6 #dee2e6 #fff;
        color: #495057;
    }
    
    .upload-area {
        background-color: #fdf2f2;
        border: 1px dashed #dee2e6;
        border-radius: 8px;
        padding: 40px 20px;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s ease;
        width: 100%;
        display: block;
    }
    
    .upload-area:hover {
        background-color: #fce8e8;
        border-color: #fd7e14;
    }
    
    .version-display {
        background-color: #f8f9fa;
        border: 1px solid #dee2e6;
        border-radius: 8px;
        padding: 20px;
        text-align: center;
        margin-bottom: 20px;
    }
    
    .spinner {
        display: inline-block;
        width: 16px;
        height: 16px;
        border: 2px solid #f3f3f3;
        border-top: 2px solid #007bff;
        border-radius: 50%;
        animation: spin 1s linear infinite;
        margin-right: 8px;
    }
    
    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    .tab-content {
        display: none;
    }

    .tab-content.active {
        display: block;
    }

    .update-status {
        margin-top: 15px;
        padding: 12px;
        border-radius: 5px;
        font-size: 14px;
        display: none;
        text-align: center;
    }

    .update-status.checking {
        display: block;
        background-color: #ebf8ff;
        color: #2b6cb0;
    }

    .update-status.available {
        display: block;
        background-color: #f0fff4;
        color: #276749;
    }

    .update-status.none {
        display: block;
        background-color: #fff5f5;
        color: #3dc530;
    }

    .available-update-list {
        margin-top: 15px;
        display: none;
        flex-direction: column;
        gap: 24px;
    }

    .available-update-list.show {
        display: flex;
    }

    .update-card {
        background-color: #ffffff;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.01);
        transition: all 0.2s ease;
        border: 1px solid rgba(0, 0, 0, 0.05);
    }

    .update-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
    }

    .update-content {
        display: flex;
        flex-direction: column;
    }

    .update-info {
        flex: 1;
        padding: 32px;
    }

    .update-header {
        margin-bottom: 16px;
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .update-version {
        font-size: 20px;
        font-weight: 700;
        color: #2d3748;
        letter-spacing: -0.025em;
        display: flex;
        align-items: center;
    }

    .update-date {
        font-size: 15px;
        color: #718096;
        font-weight: 500;
    }

    .update-action {
        padding: 24px;
        background: linear-gradient(to right, rgba(249, 250, 251, 0.5), rgba(249, 250, 251, 0.8));
        display: flex;
        justify-content: center;
        gap: 16px;
        border-top: 1px solid rgba(0, 0, 0, 0.03);
    }

    .download-button {
        background-color: #4299e1;
        color: white;
        border: none;
        border-radius: 8px;
        padding: 10px 18px;
        font-size: 12px;
        font-weight: 600;
        cursor: pointer;
        display: flex;
        align-items: center;
        transition: all 0.2s ease;
        box-shadow: 0 4px 6px -1px rgba(66, 153, 225, 0.2), 0 2px 4px -1px rgba(66, 153, 225, 0.1);
    }

    .download-button:hover {
        background-color: #3182ce;
        transform: translateY(-1px);
        box-shadow: 0 6px 10px -1px rgba(66, 153, 225, 0.3), 0 4px 6px -2px rgba(66, 153, 225, 0.15);
    }

    .download-button.disabled-button {
        background-color: #d1d5db;
        color: #6b7280;
        cursor: not-allowed;
        box-shadow: none;
        transform: none;
    }

    .changelog-button {
        background-color: transparent;
        color: #4299e1;
        border: 2px solid #4299e1;
        border-radius: 8px;
        padding: 8px 18px;
        font-size: 12px;
        font-weight: 600;
        cursor: pointer;
        display: flex;
        align-items: center;
        transition: all 0.2s ease;
    }

    .changelog-button:hover {
        background-color: #ebf8ff;
        color: #3182ce;
        border-color: #3182ce;
        transform: translateY(-1px);
    }

    .download-icon,
    .changelog-icon {
        margin-right: 16px;
        width: 18px;
        height: 18px;
    }

    /* Modal styles */
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 1000;
        align-items: center;
        justify-content: center;
        overflow-y: auto;
    }

    .modal.active {
        display: flex;
    }

    .modal-content {
        background-color: #ffffff;
        border-radius: 12px;
        max-width: 600px;
        width: 90%;
        padding: 24px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        position: relative;
        max-height: 80vh;
        overflow-y: auto;
    }

    .modal-close {
        position: absolute;
        top: 16px;
        right: 16px;
        font-size: 20px;
        color: #4a5568;
        cursor: pointer;
        transition: color 0.2s ease;
    }

    .modal-close:hover {
        color: #2d3748;
    }

    .modal-title {
        font-size: 20px;
        font-weight: 700;
        color: #2d3748;
        margin-bottom: 16px;
    }

    .modal-body {
        font-size: 15px;
        color: #4a5568;
        line-height: 1.6;
    }
</style>
@endpush

@section('main_content')
    <div class="page-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">
                            {{translate($title)}}
                        </h4>
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">
                                    {{translate('Home')}}
                                </a></li>
                                <li class="breadcrumb-item active">
                                    {{translate($title)}}
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mt-3">
                <div class="card-header">
                    <h4 class="card-title">
                        {{translate('Be Aware !!! Before upgrade')}}
                    </h4>
                </div>
                <div class="card-body">
                    <ul class="update-list">
                        <li><i class="ri-checkbox-circle-line"></i>{{ translate("You must take backup from your server (files & database)") }}</li>
                        <li><i class="ri-checkbox-circle-line"></i>{{ translate("Make Sure You have stable internet connection") }}</li>
                        <li><i class="ri-checkbox-circle-line"></i>{{ translate("Make Sure You have stable internet connection") }}</li>
                        <li class="text-danger"><i class="ri-checkbox-circle-line"></i>{{ translate("Do not close the tab while the process is running") }}</li>
                    </ul>
                </div>
            </div>

            <div class="card mt-3">
                <div class="card-body">
                    <ul class="nav nav-tabs mb-4" role="tablist">
                        <li class="nav-item">
                            <div class="nav-link active tab-link" data-tab="manual-update">
                                {{translate("Manual Update")}}
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-link tab-link" data-tab="click-update">
                                {{translate("Click & Update")}}
                            </div>
                        </li>
                    </ul>

                    <div class="tab-content active" id="manual-update">
                        <div class="version-display">
                            <small class="text-muted text-uppercase">{{ translate("Current Version") }}</small>
                            <h3 class="mb-1">{{ translate('V') }}{{ site_settings("app_version", 1.1) }}</h3>
                            <small class="text-muted">{{ get_date_time(site_settings("system_installed_at", \Carbon\Carbon::now())) }}</small>
                        </div>
                        
                        <form action="{{route('admin.system.update')}}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="mb-3">
                                <label for="updateFile" class="upload-area">
                                    <input name="updateFile" hidden accept=".zip" type="file" id="updateFile">
                                    <i class="ri-file-zip-line text-warning" style="font-size: 2rem;"></i>
                                    <h5 class="mt-2 mb-0">{{translate("Upload Zip file")}}</h5>
                                </label>
                            </div>
                            <button class="btn btn-success" type="submit">
                                {{translate("Update Now")}}
                            </button>
                        </form>
                    </div>

                    <div class="tab-content" id="click-update">
                        <div class="update-status" id="updateStatus">
                            <div class="spinner" style="display: none;"></div>
                            {{translate("Checking for updates...")}}
                        </div>
                        <div class="available-update-list" id="updateAvailableList">
                            <!-- Update items will be dynamically inserted here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for changelog -->
    <div class="modal" id="changelogModal">
        <div class="modal-content">
            <span class="modal-close">&times;</span>
            <h2 class="modal-title">{{translate("Changelog")}}</h2>
            <div class="modal-body" id="changelogContent"></div>
        </div>
    </div>
@endsection

@push('script-push')
<script>
    const currentAppVersion = "{{ site_settings('app_version', 1.1) }}";
</script>

<script>
    "use strict";
    $(document).ready(function() {
        const $updateStatus = $('#updateStatus');
        const $updateList = $('#updateAvailableList');
        const $spinner = $('.spinner');
        const $changelogModal = $('#changelogModal');
        const $changelogContent = $('#changelogContent');

        function compareVersions(v1, v2) {
            const v1Parts = v1.split('.').map(Number);
            const v2Parts = v2.split('.').map(Number);
            for (let i = 0; i < Math.max(v1Parts.length, v2Parts.length); i++) {
                const part1 = v1Parts[i] || 0;
                const part2 = v2Parts[i] || 0;
                if (part1 < part2) return -1;
                if (part1 > part2) return 1;
            }
            return 0;
        }

        function checkupdate() {
            console.log('triggered');

            $updateStatus.attr('class', 'update-status checking');
            $updateStatus.text('{{translate("Checking for updates...")}}');
            $updateList.attr('class', 'available-update-list');
            $updateList.empty();
            $spinner.css('display', 'inline-block');

            $.ajax({
                url: '{{ route("admin.system.check.update") }}',
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    console.log(response);

                    if (response.success && response.data && response.data.length > 0) {
                        const currentVersion = currentAppVersion;

                        // Sort updates by version number (ascending)
                        response.data.sort((a, b) => compareVersions(a.version, b.version));

                        // Find the next version
                        let nextVersion = null;
                        for (const update of response.data) {
                            if (compareVersions(update.version, currentVersion) > 0) {
                                nextVersion = update.version;
                                break;
                            }
                        }

                        $updateStatus.attr('class', 'update-status available');
                        $updateStatus.text(response.data.length + ' {{translate("updates available!")}}');
                        $updateList.attr('class', 'available-update-list show');
                        $.each(response.data, function(index, update) {
                            const isNextVersion = update.version === nextVersion;
                            const disabledAttr = isNextVersion ? '' : 'disabled';
                            const disabledClass = isNextVersion ? '' : 'disabled-button';
                            const updateItem = $('<div>', {
                                class: 'update-card'
                            });
                            updateItem.html(`
                                <div class="update-content">
                                    <div class="update-info">
                                        <div class="update-header">
                                            <span class="update-version"> V${update.version}</span>
                                            <span class="update-date">Release date : ${update.release_date}</span>
                                        </div>
                                    </div>
                                    <div class="update-action">
                                        <button class="download-button ${disabledClass}" data-version="${update.version}" ${disabledAttr}>
                                            <svg class="download-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                                <polyline points="7 10 12 15 17 10"></polyline>
                                                <line x1="12" y1="15" x2="12" y2="3"></line>
                                            </svg>
                                            {{translate("Download & Install")}}
                                        </button>
                                        <button class="changelog-button" data-changelog="${encodeURIComponent(update.changelog)}">
                                            <svg class="changelog-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                                <polyline points="14 2 14 8 20 8"></polyline>
                                                <line x1="16" y1="13" x2="8" y2="13"></line>
                                                <line x1="16" y1="17" x2="8" y2="17"></line>
                                                <polyline points="10 9 9 9 8 9"></polyline>
                                            </svg>
                                            {{translate("View Changelog")}}
                                        </button>
                                    </div>
                                </div>
                            `);
                            $updateList.append(updateItem);
                        });
                        $('.download-button:not(.disabled-button)').on('click', function() {
                            const $button = $(this);
                            $button.prop('disabled', true).addClass('disabled-button');
                            const version = $button.data('version');
                            downloadAndInstallUpdate(version);
                        });
                        $('.changelog-button').on('click', function() {
                            const changelog = decodeURIComponent($(this).data('changelog'));
                            $changelogContent.html(changelog);
                            $changelogModal.addClass('active');
                        });
                    } else {
                        $updateStatus.attr('class', 'update-status none');
                        $updateStatus.text('{{translate("Your software is up to date.")}}');
                    }
                },
                error: function(xhr, status, error) {
                    $updateStatus.attr('class', 'update-status none');
                    $updateStatus.text('{{translate("Error checking for updates. Please try again later.")}}');
                    console.error('Update check failed:', error);
                },
                complete: function() {
                    $spinner.css('display', 'none');
                }
            });
        }

        // Tab switching logic
        $('.tab-link').on('click', function() {
            const tabId = $(this).data('tab');
            $('.tab-link').removeClass('active');
            $('.tab-content').removeClass('active');
            $(this).addClass('active');
            $('#' + tabId).addClass('active');

            if (tabId == 'click-update') {
                checkupdate();
            }
        });

        // Modal close logic
        $('.modal-close, .modal').on('click', function(e) {
            if (e.target === this) {
                $changelogModal.removeClass('active');
            }
        });

        function downloadAndInstallUpdate(version) {
            $updateStatus.attr('class', 'update-status checking');
            $updateStatus.text('{{translate("Downloading and installing update")}} ' + version + '...');
            $spinner.css('display', 'inline-block');
            
            $.ajax({
                url: '{{ route("admin.system.install.update") }}',
                type: 'POST',
                data: {
                    version: version,
                    _token: '{{ csrf_token() }}'
                },
                dataType: 'json',
                success: function(response) {
                    if (response.success == true) {
                        $updateStatus.attr('class', 'update-status available');
                        $updateStatus.text('{{translate("Update installed successfully! Refreshing page...")}}');
                        setTimeout(function() {
                            window.location.reload();
                        }, 2000);
                    } else {
                        $updateStatus.attr('class', 'update-status none');
                        $updateStatus.text('{{translate("Update installation failed:")}} ' + response.message);
                    }
                },
                error: function(xhr, status, error) {
                    $updateStatus.attr('class', 'update-status none');
                    $updateStatus.text('{{translate("Error installing update. Please try again later.")}}');
                    console.error('Update installation failed:', error);
                },
                complete: function() {
                    $spinner.css('display', 'none');
                }
            });
        }
    });
</script>
@endpush