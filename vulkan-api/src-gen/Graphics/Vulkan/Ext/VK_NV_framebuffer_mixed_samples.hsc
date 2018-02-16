#include "vulkan/vulkan.h"

{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MagicHash             #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PatternSynonyms       #-}
{-# LANGUAGE Strict                #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE ViewPatterns          #-}
module Graphics.Vulkan.Ext.VK_NV_framebuffer_mixed_samples
       (-- * Vulkan extension: @VK_NV_framebuffer_mixed_samples@
        -- |
        --
        -- supported: @vulkan@
        --
        -- contact: @Jeff Bolz @jbolz@
        --
        -- author: @NV@
        --
        -- type: @device@
        --
        -- Extension number: @153@
        VkPipelineCoverageModulationStateCreateInfoNV(..),
        VK_NV_FRAMEBUFFER_MIXED_SAMPLES_SPEC_VERSION,
        pattern VK_NV_FRAMEBUFFER_MIXED_SAMPLES_SPEC_VERSION,
        VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME,
        pattern VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME,
        pattern VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_MODULATION_STATE_CREATE_INFO_NV)
       where
import           Foreign.C.String                 (CString)
import           Foreign.Storable                 (Storable (..))
import           GHC.Prim
import           GHC.Ptr                          (Ptr (..))
import           Graphics.Vulkan.Common           (VkBool32,
                                                   VkCoverageModulationModeNV,
                                                   VkPipelineCoverageModulationStateCreateFlagsNV,
                                                   VkStructureType,
                                                   VkStructureType (..), Word32)
import           Graphics.Vulkan.Marshal
import           Graphics.Vulkan.Marshal.Internal
import           Graphics.Vulkan.StructMembers
import           System.IO.Unsafe                 (unsafeDupablePerformIO)

-- | > typedef struct VkPipelineCoverageModulationStateCreateInfoNV {
--   >     VkStructureType sType;
--   >     const void*                                                                      pNext;
--   >     VkPipelineCoverageModulationStateCreateFlagsNV                   flags;
--   >     VkCoverageModulationModeNV                                                       coverageModulationMode;
--   >     VkBool32                                                                         coverageModulationTableEnable;
--   >     uint32_t                                                                         coverageModulationTableCount;
--   >     const float* pCoverageModulationTable;
--   > } VkPipelineCoverageModulationStateCreateInfoNV;
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/VkPipelineCoverageModulationStateCreateInfoNV.html VkPipelineCoverageModulationStateCreateInfoNV registry at www.khronos.org>
data VkPipelineCoverageModulationStateCreateInfoNV = VkPipelineCoverageModulationStateCreateInfoNV## Addr##
                                                                                                    ByteArray##

instance Eq VkPipelineCoverageModulationStateCreateInfoNV where
        (VkPipelineCoverageModulationStateCreateInfoNV## a _) ==
          x@(VkPipelineCoverageModulationStateCreateInfoNV## b _)
          = EQ == cmpBytes## (sizeOf x) a b

        {-# INLINE (==) #-}

instance Ord VkPipelineCoverageModulationStateCreateInfoNV where
        (VkPipelineCoverageModulationStateCreateInfoNV## a _) `compare`
          x@(VkPipelineCoverageModulationStateCreateInfoNV## b _)
          = cmpBytes## (sizeOf x) a b

        {-# INLINE compare #-}

instance Storable VkPipelineCoverageModulationStateCreateInfoNV
         where
        sizeOf ~_
          = #{size VkPipelineCoverageModulationStateCreateInfoNV}

        {-# INLINE sizeOf #-}
        alignment ~_
          = #{alignment VkPipelineCoverageModulationStateCreateInfoNV}

        {-# INLINE alignment #-}
        peek = peekVkData##

        {-# INLINE peek #-}
        poke = pokeVkData##

        {-# INLINE poke #-}

instance VulkanMarshalPrim
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        unsafeAddr (VkPipelineCoverageModulationStateCreateInfoNV## a _) = a

        {-# INLINE unsafeAddr #-}
        unsafeByteArray
          (VkPipelineCoverageModulationStateCreateInfoNV## _ b) = b

        {-# INLINE unsafeByteArray #-}
        unsafeFromByteArrayOffset off b
          = VkPipelineCoverageModulationStateCreateInfoNV##
              (plusAddr## (byteArrayContents## b) off)
              b

        {-# INLINE unsafeFromByteArrayOffset #-}

instance VulkanMarshal
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        type StructFields VkPipelineCoverageModulationStateCreateInfoNV =
             '["sType", "pNext", "flags", "coverageModulationMode", -- ' closing tick for hsc2hs
               "coverageModulationTableEnable", "coverageModulationTableCount",
               "pCoverageModulationTable"]

instance {-# OVERLAPPING #-}
         HasVkSType VkPipelineCoverageModulationStateCreateInfoNV where
        type VkSTypeMType VkPipelineCoverageModulationStateCreateInfoNV =
             VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPipelineCoverageModulationStateCreateInfoNV, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, sType}

instance {-# OVERLAPPING #-}
         HasField "sType" VkPipelineCoverageModulationStateCreateInfoNV
         where
        type FieldType "sType"
               VkPipelineCoverageModulationStateCreateInfoNV
             = VkStructureType
        type FieldOptional "sType"
               VkPipelineCoverageModulationStateCreateInfoNV
             = 'False -- ' closing tick for hsc2hs
        type FieldOffset "sType"
               VkPipelineCoverageModulationStateCreateInfoNV
             =
             #{offset VkPipelineCoverageModulationStateCreateInfoNV, sType}

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, sType}

instance CanReadField "sType"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE getField #-}
        getField = vkSType

        {-# INLINE readField #-}
        readField = readVkSType

instance CanWriteField "sType"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE writeField #-}
        writeField = writeVkSType

instance {-# OVERLAPPING #-}
         HasVkPNext VkPipelineCoverageModulationStateCreateInfoNV where
        type VkPNextMType VkPipelineCoverageModulationStateCreateInfoNV =
             Ptr Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPipelineCoverageModulationStateCreateInfoNV, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, pNext}

instance {-# OVERLAPPING #-}
         HasField "pNext" VkPipelineCoverageModulationStateCreateInfoNV
         where
        type FieldType "pNext"
               VkPipelineCoverageModulationStateCreateInfoNV
             = Ptr Void
        type FieldOptional "pNext"
               VkPipelineCoverageModulationStateCreateInfoNV
             = 'False -- ' closing tick for hsc2hs
        type FieldOffset "pNext"
               VkPipelineCoverageModulationStateCreateInfoNV
             =
             #{offset VkPipelineCoverageModulationStateCreateInfoNV, pNext}

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, pNext}

instance CanReadField "pNext"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE getField #-}
        getField = vkPNext

        {-# INLINE readField #-}
        readField = readVkPNext

instance CanWriteField "pNext"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE writeField #-}
        writeField = writeVkPNext

instance {-# OVERLAPPING #-}
         HasVkFlags VkPipelineCoverageModulationStateCreateInfoNV where
        type VkFlagsMType VkPipelineCoverageModulationStateCreateInfoNV =
             VkPipelineCoverageModulationStateCreateFlagsNV

        {-# NOINLINE vkFlags #-}
        vkFlags x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPipelineCoverageModulationStateCreateInfoNV, flags})

        {-# INLINE vkFlagsByteOffset #-}
        vkFlagsByteOffset ~_
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, flags}

        {-# INLINE readVkFlags #-}
        readVkFlags p
          = peekByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, flags}

        {-# INLINE writeVkFlags #-}
        writeVkFlags p
          = pokeByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, flags}

instance {-# OVERLAPPING #-}
         HasField "flags" VkPipelineCoverageModulationStateCreateInfoNV
         where
        type FieldType "flags"
               VkPipelineCoverageModulationStateCreateInfoNV
             = VkPipelineCoverageModulationStateCreateFlagsNV
        type FieldOptional "flags"
               VkPipelineCoverageModulationStateCreateInfoNV
             = 'True -- ' closing tick for hsc2hs
        type FieldOffset "flags"
               VkPipelineCoverageModulationStateCreateInfoNV
             =
             #{offset VkPipelineCoverageModulationStateCreateInfoNV, flags}

        {-# INLINE fieldOptional #-}
        fieldOptional = True

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, flags}

instance CanReadField "flags"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE getField #-}
        getField = vkFlags

        {-# INLINE readField #-}
        readField = readVkFlags

instance CanWriteField "flags"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE writeField #-}
        writeField = writeVkFlags

instance {-# OVERLAPPING #-}
         HasVkCoverageModulationMode
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        type VkCoverageModulationModeMType
               VkPipelineCoverageModulationStateCreateInfoNV
             = VkCoverageModulationModeNV

        {-# NOINLINE vkCoverageModulationMode #-}
        vkCoverageModulationMode x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationMode})

        {-# INLINE vkCoverageModulationModeByteOffset #-}
        vkCoverageModulationModeByteOffset ~_
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationMode}

        {-# INLINE readVkCoverageModulationMode #-}
        readVkCoverageModulationMode p
          = peekByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationMode}

        {-# INLINE writeVkCoverageModulationMode #-}
        writeVkCoverageModulationMode p
          = pokeByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationMode}

instance {-# OVERLAPPING #-}
         HasField "coverageModulationMode"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        type FieldType "coverageModulationMode"
               VkPipelineCoverageModulationStateCreateInfoNV
             = VkCoverageModulationModeNV
        type FieldOptional "coverageModulationMode"
               VkPipelineCoverageModulationStateCreateInfoNV
             = 'False -- ' closing tick for hsc2hs
        type FieldOffset "coverageModulationMode"
               VkPipelineCoverageModulationStateCreateInfoNV
             =
             #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationMode}

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationMode}

instance CanReadField "coverageModulationMode"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE getField #-}
        getField = vkCoverageModulationMode

        {-# INLINE readField #-}
        readField = readVkCoverageModulationMode

instance CanWriteField "coverageModulationMode"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE writeField #-}
        writeField = writeVkCoverageModulationMode

instance {-# OVERLAPPING #-}
         HasVkCoverageModulationTableEnable
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        type VkCoverageModulationTableEnableMType
               VkPipelineCoverageModulationStateCreateInfoNV
             = VkBool32

        {-# NOINLINE vkCoverageModulationTableEnable #-}
        vkCoverageModulationTableEnable x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationTableEnable})

        {-# INLINE vkCoverageModulationTableEnableByteOffset #-}
        vkCoverageModulationTableEnableByteOffset ~_
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationTableEnable}

        {-# INLINE readVkCoverageModulationTableEnable #-}
        readVkCoverageModulationTableEnable p
          = peekByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationTableEnable}

        {-# INLINE writeVkCoverageModulationTableEnable #-}
        writeVkCoverageModulationTableEnable p
          = pokeByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationTableEnable}

instance {-# OVERLAPPING #-}
         HasField "coverageModulationTableEnable"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        type FieldType "coverageModulationTableEnable"
               VkPipelineCoverageModulationStateCreateInfoNV
             = VkBool32
        type FieldOptional "coverageModulationTableEnable"
               VkPipelineCoverageModulationStateCreateInfoNV
             = 'False -- ' closing tick for hsc2hs
        type FieldOffset "coverageModulationTableEnable"
               VkPipelineCoverageModulationStateCreateInfoNV
             =
             #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationTableEnable}

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationTableEnable}

instance CanReadField "coverageModulationTableEnable"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE getField #-}
        getField = vkCoverageModulationTableEnable

        {-# INLINE readField #-}
        readField = readVkCoverageModulationTableEnable

instance CanWriteField "coverageModulationTableEnable"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE writeField #-}
        writeField = writeVkCoverageModulationTableEnable

instance {-# OVERLAPPING #-}
         HasVkCoverageModulationTableCount
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        type VkCoverageModulationTableCountMType
               VkPipelineCoverageModulationStateCreateInfoNV
             = Word32

        {-# NOINLINE vkCoverageModulationTableCount #-}
        vkCoverageModulationTableCount x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationTableCount})

        {-# INLINE vkCoverageModulationTableCountByteOffset #-}
        vkCoverageModulationTableCountByteOffset ~_
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationTableCount}

        {-# INLINE readVkCoverageModulationTableCount #-}
        readVkCoverageModulationTableCount p
          = peekByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationTableCount}

        {-# INLINE writeVkCoverageModulationTableCount #-}
        writeVkCoverageModulationTableCount p
          = pokeByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationTableCount}

instance {-# OVERLAPPING #-}
         HasField "coverageModulationTableCount"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        type FieldType "coverageModulationTableCount"
               VkPipelineCoverageModulationStateCreateInfoNV
             = Word32
        type FieldOptional "coverageModulationTableCount"
               VkPipelineCoverageModulationStateCreateInfoNV
             = 'False -- ' closing tick for hsc2hs
        type FieldOffset "coverageModulationTableCount"
               VkPipelineCoverageModulationStateCreateInfoNV
             =
             #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationTableCount}

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, coverageModulationTableCount}

instance CanReadField "coverageModulationTableCount"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE getField #-}
        getField = vkCoverageModulationTableCount

        {-# INLINE readField #-}
        readField = readVkCoverageModulationTableCount

instance CanWriteField "coverageModulationTableCount"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE writeField #-}
        writeField = writeVkCoverageModulationTableCount

instance {-# OVERLAPPING #-}
         HasVkPCoverageModulationTable
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        type VkPCoverageModulationTableMType
               VkPipelineCoverageModulationStateCreateInfoNV
             = Ptr #{type float}

        {-# NOINLINE vkPCoverageModulationTable #-}
        vkPCoverageModulationTable x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkPipelineCoverageModulationStateCreateInfoNV, pCoverageModulationTable})

        {-# INLINE vkPCoverageModulationTableByteOffset #-}
        vkPCoverageModulationTableByteOffset ~_
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, pCoverageModulationTable}

        {-# INLINE readVkPCoverageModulationTable #-}
        readVkPCoverageModulationTable p
          = peekByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, pCoverageModulationTable}

        {-# INLINE writeVkPCoverageModulationTable #-}
        writeVkPCoverageModulationTable p
          = pokeByteOff p #{offset VkPipelineCoverageModulationStateCreateInfoNV, pCoverageModulationTable}

instance {-# OVERLAPPING #-}
         HasField "pCoverageModulationTable"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        type FieldType "pCoverageModulationTable"
               VkPipelineCoverageModulationStateCreateInfoNV
             = Ptr #{type float}
        type FieldOptional "pCoverageModulationTable"
               VkPipelineCoverageModulationStateCreateInfoNV
             = 'True -- ' closing tick for hsc2hs
        type FieldOffset "pCoverageModulationTable"
               VkPipelineCoverageModulationStateCreateInfoNV
             =
             #{offset VkPipelineCoverageModulationStateCreateInfoNV, pCoverageModulationTable}

        {-# INLINE fieldOptional #-}
        fieldOptional = True

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkPipelineCoverageModulationStateCreateInfoNV, pCoverageModulationTable}

instance CanReadField "pCoverageModulationTable"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE getField #-}
        getField = vkPCoverageModulationTable

        {-# INLINE readField #-}
        readField = readVkPCoverageModulationTable

instance CanWriteField "pCoverageModulationTable"
           VkPipelineCoverageModulationStateCreateInfoNV
         where
        {-# INLINE writeField #-}
        writeField = writeVkPCoverageModulationTable

instance Show VkPipelineCoverageModulationStateCreateInfoNV where
        showsPrec d x
          = showString "VkPipelineCoverageModulationStateCreateInfoNV {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkFlags = " .
                            showsPrec d (vkFlags x) .
                              showString ", " .
                                showString "vkCoverageModulationMode = " .
                                  showsPrec d (vkCoverageModulationMode x) .
                                    showString ", " .
                                      showString "vkCoverageModulationTableEnable = " .
                                        showsPrec d (vkCoverageModulationTableEnable x) .
                                          showString ", " .
                                            showString "vkCoverageModulationTableCount = " .
                                              showsPrec d (vkCoverageModulationTableCount x) .
                                                showString ", " .
                                                  showString "vkPCoverageModulationTable = " .
                                                    showsPrec d (vkPCoverageModulationTable x) .
                                                      showChar '}'

pattern VK_NV_FRAMEBUFFER_MIXED_SAMPLES_SPEC_VERSION ::
        (Num a, Eq a) => a

pattern VK_NV_FRAMEBUFFER_MIXED_SAMPLES_SPEC_VERSION = 1

type VK_NV_FRAMEBUFFER_MIXED_SAMPLES_SPEC_VERSION = 1

pattern VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME :: CString

pattern VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME <-
        (is_VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME -> True)
  where VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME
          = _VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME

{-# INLINE _VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME #-}

_VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME :: CString
_VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME
  = Ptr "VK_NV_framebuffer_mixed_samples\NUL"##

{-# INLINE is_VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME #-}

is_VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME ::
                                                  CString -> Bool
is_VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME
  = eqCStrings _VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME

type VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME =
     "VK_NV_framebuffer_mixed_samples"

pattern VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_MODULATION_STATE_CREATE_INFO_NV
        :: VkStructureType

pattern VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_MODULATION_STATE_CREATE_INFO_NV
        = VkStructureType 1000152000
