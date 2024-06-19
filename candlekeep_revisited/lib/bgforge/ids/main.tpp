TEXT_SPRINT BGFORGE_IDS_DIR ~%BGFORGE_LIB_DIR%/IDS~

PATCH_INCLUDE
  ~%BGFORGE_IDS_DIR%/effect_ids.tpp~
  ~%BGFORGE_IDS_DIR%/types.tpp~
// ~%BGFORGE_IDS_DIR%/projectile_ids.tpp~ // not sure how to handle this best, see https://github.com/Gibberlings3/iesdp/pull/91

PATCH_IF (GAME_IS ~IWDEE~) BEGIN PATCH_INCLUDE ~%BGFORGE_IDS_DIR%/spell_ids_iwdee.tpp~ END
PATCH_IF (GAME_IS ~BGEE~) BEGIN PATCH_INCLUDE ~%BGFORGE_IDS_DIR%/spell_ids_bgee.tpp~ END
PATCH_IF (GAME_INCLUDES ~SOA~) BEGIN PATCH_INCLUDE ~%BGFORGE_IDS_DIR%/spell_ids_bg2ee.tpp~ END
