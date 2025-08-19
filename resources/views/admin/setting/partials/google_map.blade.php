
<div class="border rounded">

    <div class="border-bottom px-3 py-3">
        <h5 class="mb-0 fs-14">
            {{$tab}}
        </h5>
    </div>

    <div class="p-3">
        <form class="settingsForm" data-route ="{{route('admin.general.setting.store')}}">

            @csrf

            <div class="row g-4 mb-4">

                <div class="col-lg-6">
                    <label for="gmap_client_key" class="form-label">
                        {{translate('Client key')}} <span class="text-danger">*</span>
                    </label>
                    <input type="text" name="site_settings[gmap_client_key]" class="form-control" id="gmap_client_key"  value="{{!is_demo()? site_settings('gmap_client_key') :"@@@"}}" >
                </div>

                <div class="col-lg-6">
                    <label for="gmap_server_key" class="form-label">
                        {{translate('Server key')}}
                    </label>
                    <input type="text" name="site_settings[gmap_server_key]" class="form-control" id="gmap_server_key"  value="{{!is_demo()?site_settings('gmap_server_key') : "@@@"}}" >
                </div>

                <div class="col-lg-6">
                    <label for="gmap_status" class="form-label">
                        {{translate('Google Map')}}
                    </label>

                    <select class="form-select" name="site_settings[gmap_status]" id="gmap_status">
                        <option value="">
                            {{translate('Select status')}}
                         </option>
                        <option {{site_settings('gmap_status') ==  App\Enums\StatusEnum::true->status() ? 'selected' : '' }} value="{{App\Enums\StatusEnum::true->status()}}">
                            {{translate("Enable")}}
                        </option>
                        <option {{site_settings('gmap_status') ==  App\Enums\StatusEnum::false->status() ? 'selected' : '' }} value="{{App\Enums\StatusEnum::false->status()}}">
                                {{translate("Disable")}}
                        </option>
                    </select>
                </div>

            </div>

            <div class="text-start">
                <button type="submit"
                    class="btn btn-success waves ripple-light"
                    id="add-btn">
                    {{translate('Submit')}}
                </button>
            </div>

        </form>
    </div>

</div>

