<?php

namespace App\Models;

use App\Enums\StatusEnum;
use App\Traits\Filterable;
use Illuminate\Support\Str;
use App\Enums\TutorialPlatform;
use App\Enums\TutorialAudience;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Auth;

class Tutorial extends Model
{
    use HasFactory, Filterable;

    protected $fillable = [
        'uid',
        'status',
        'platform',
        'audience',
        'title',
        'description',
        'files',
    ];

    protected $casts = [
        'files' => 'array',
    ];

    /**
     * Summary of boot
     * @return void
     */
    protected static function boot(): void
    {
        parent::boot();
        static::creating(function ($model) {
            $model->uid         = (string) Str::uuid();
            $model->platform    = TutorialPlatform::APP->value;
            $model->audience    = TutorialAudience::SELLER->value;
        });
    }

    /**
     * Summary of scopeActive
     * @param mixed $query
     */
    public function scopeActive($query)
    {
        return $query->where('status', StatusEnum::true->status());
    }

    /**
     * Summary of scopeInactive
     * @param mixed $query
     */
    public function scopeInactive($query)
    {
        return $query->where('status', StatusEnum::false->status());
    }

    /**
     * Summary of scopeApp
     * @param mixed $query
     */
    public function scopeApp($query)
    {
        return $query->where('platform', TutorialPlatform::APP->value);
    }

    public function scopeSeller($query)
    {
        return $query->where('audience', TutorialAudience::SELLER->value);
    }

    /**
     * Summary of author
     * @return BelongsTo
     */
    public function author(): BelongsTo {
        return $this->belongsTo(Admin::class, "created_by", "id");
    }

    /**
     * Summary of updatedBy
     * @return BelongsTo
     */
    public function updatedBy(): BelongsTo {
        return $this->belongsTo(Admin::class, "updated_by", "id");
    }
}
