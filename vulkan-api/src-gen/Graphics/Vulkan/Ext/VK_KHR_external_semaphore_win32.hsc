#include "vulkan/vulkan.h"

{-# LANGUAGE DataKinds                #-}
{-# LANGUAGE FlexibleInstances        #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE MagicHash                #-}
{-# LANGUAGE MultiParamTypeClasses    #-}
{-# LANGUAGE PatternSynonyms          #-}
{-# LANGUAGE Strict                   #-}
{-# LANGUAGE TypeFamilies             #-}
{-# LANGUAGE ViewPatterns             #-}
module Graphics.Vulkan.Ext.VK_KHR_external_semaphore_win32
       (-- * Vulkan extension: @VK_KHR_external_semaphore_win32@
        -- |
        --
        -- supported: @vulkan@
        --
        -- contact: @James Jones @cubanismo@
        --
        -- author: @KHR@
        --
        -- type: @device@
        --
        -- Extension number: @79@
        --
        -- Required extensions: 'VK_KHR_external_semaphore'.
        --
        -- Protected by CPP ifdef: @VK_USE_PLATFORM_WIN32_KHR@
        --

        -- ** Required extensions: 'VK_KHR_external_semaphore'.
        VkImportSemaphoreWin32HandleInfoKHR(..),
        VkExportSemaphoreWin32HandleInfoKHR(..),
        VkD3D12FenceSubmitInfoKHR(..),
        VkSemaphoreGetWin32HandleInfoKHR(..),
        vkImportSemaphoreWin32HandleKHR, vkGetSemaphoreWin32HandleKHR,
        VK_KHR_EXTERNAL_SEMAPHORE_WIN32_SPEC_VERSION,
        pattern VK_KHR_EXTERNAL_SEMAPHORE_WIN32_SPEC_VERSION,
        VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME,
        pattern VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME,
        pattern VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR,
        pattern VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR,
        pattern VK_STRUCTURE_TYPE_D3D12_FENCE_SUBMIT_INFO_KHR,
        pattern VK_STRUCTURE_TYPE_SEMAPHORE_GET_WIN32_HANDLE_INFO_KHR)
       where
import           Foreign.Storable                 (Storable (..))
import           GHC.Prim
import           GHC.Ptr                          (Ptr (..))
import           Graphics.Vulkan.Base             (VkSemaphoreCreateInfo,
                                                   VkSubmitInfo)
import           Graphics.Vulkan.Common
import           Graphics.Vulkan.Marshal
import           Graphics.Vulkan.Marshal.Internal
import           Graphics.Vulkan.StructMembers
import           System.IO.Unsafe                 (unsafeDupablePerformIO)

-- | > typedef struct VkImportSemaphoreWin32HandleInfoKHR {
--   >     VkStructureType sType;
--   >     const void*                      pNext;
--   >     VkSemaphore    semaphore;
--   >     VkSemaphoreImportFlagsKHR flags;
--   >     VkExternalSemaphoreHandleTypeFlagBitsKHR handleType;
--   >     HANDLE           handle;
--   >     LPCWSTR          name;
--   > } VkImportSemaphoreWin32HandleInfoKHR;
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/man/html/VkImportSemaphoreWin32HandleInfoKHR.html VkImportSemaphoreWin32HandleInfoKHR registry at www.khronos.org>
data VkImportSemaphoreWin32HandleInfoKHR = VkImportSemaphoreWin32HandleInfoKHR## Addr##
                                                                                ByteArray##

instance Eq VkImportSemaphoreWin32HandleInfoKHR where
        (VkImportSemaphoreWin32HandleInfoKHR## a _) ==
          x@(VkImportSemaphoreWin32HandleInfoKHR## b _)
          = EQ == cmpBytes## (sizeOf x) a b

        {-# INLINE (==) #-}

instance Ord VkImportSemaphoreWin32HandleInfoKHR where
        (VkImportSemaphoreWin32HandleInfoKHR## a _) `compare`
          x@(VkImportSemaphoreWin32HandleInfoKHR## b _)
          = cmpBytes## (sizeOf x) a b

        {-# INLINE compare #-}

instance Storable VkImportSemaphoreWin32HandleInfoKHR where
        sizeOf ~_ = #{size VkImportSemaphoreWin32HandleInfoKHR}

        {-# INLINE sizeOf #-}
        alignment ~_
          = #{alignment VkImportSemaphoreWin32HandleInfoKHR}

        {-# INLINE alignment #-}
        peek = peekVkData##

        {-# INLINE peek #-}
        poke = pokeVkData##

        {-# INLINE poke #-}

instance VulkanMarshalPrim VkImportSemaphoreWin32HandleInfoKHR
         where
        unsafeAddr (VkImportSemaphoreWin32HandleInfoKHR## a _) = a

        {-# INLINE unsafeAddr #-}
        unsafeByteArray (VkImportSemaphoreWin32HandleInfoKHR## _ b) = b

        {-# INLINE unsafeByteArray #-}
        unsafeFromByteArrayOffset off b
          = VkImportSemaphoreWin32HandleInfoKHR##
              (plusAddr## (byteArrayContents## b) off)
              b

        {-# INLINE unsafeFromByteArrayOffset #-}

instance VulkanMarshal VkImportSemaphoreWin32HandleInfoKHR where
        type StructFields VkImportSemaphoreWin32HandleInfoKHR =
             '["sType", "pNext", "semaphore", "flags", "handleType", "handle", -- ' closing tick for hsc2hs
               "name"]
        type CUnionType VkImportSemaphoreWin32HandleInfoKHR = 'False -- ' closing tick for hsc2hs
        type ReturnedOnly VkImportSemaphoreWin32HandleInfoKHR = 'False -- ' closing tick for hsc2hs
        type StructExtends VkImportSemaphoreWin32HandleInfoKHR = '[] -- ' closing tick for hsc2hs

instance {-# OVERLAPPING #-}
         HasVkSType VkImportSemaphoreWin32HandleInfoKHR where
        type VkSTypeMType VkImportSemaphoreWin32HandleInfoKHR =
             VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImportSemaphoreWin32HandleInfoKHR, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, sType}

instance {-# OVERLAPPING #-}
         HasField "sType" VkImportSemaphoreWin32HandleInfoKHR where
        type FieldType "sType" VkImportSemaphoreWin32HandleInfoKHR =
             VkStructureType
        type FieldOptional "sType" VkImportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs
        type FieldOffset "sType" VkImportSemaphoreWin32HandleInfoKHR =
             #{offset VkImportSemaphoreWin32HandleInfoKHR, sType}
        type FieldIsArray "sType" VkImportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, sType}

instance CanReadField "sType" VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkSType

        {-# INLINE readField #-}
        readField = readVkSType

instance CanWriteField "sType" VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkSType

instance {-# OVERLAPPING #-}
         HasVkPNext VkImportSemaphoreWin32HandleInfoKHR where
        type VkPNextMType VkImportSemaphoreWin32HandleInfoKHR = Ptr Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImportSemaphoreWin32HandleInfoKHR, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, pNext}

instance {-# OVERLAPPING #-}
         HasField "pNext" VkImportSemaphoreWin32HandleInfoKHR where
        type FieldType "pNext" VkImportSemaphoreWin32HandleInfoKHR =
             Ptr Void
        type FieldOptional "pNext" VkImportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs
        type FieldOffset "pNext" VkImportSemaphoreWin32HandleInfoKHR =
             #{offset VkImportSemaphoreWin32HandleInfoKHR, pNext}
        type FieldIsArray "pNext" VkImportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, pNext}

instance CanReadField "pNext" VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkPNext

        {-# INLINE readField #-}
        readField = readVkPNext

instance CanWriteField "pNext" VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkPNext

instance {-# OVERLAPPING #-}
         HasVkSemaphore VkImportSemaphoreWin32HandleInfoKHR where
        type VkSemaphoreMType VkImportSemaphoreWin32HandleInfoKHR =
             VkSemaphore

        {-# NOINLINE vkSemaphore #-}
        vkSemaphore x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImportSemaphoreWin32HandleInfoKHR, semaphore})

        {-# INLINE vkSemaphoreByteOffset #-}
        vkSemaphoreByteOffset ~_
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, semaphore}

        {-# INLINE readVkSemaphore #-}
        readVkSemaphore p
          = peekByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, semaphore}

        {-# INLINE writeVkSemaphore #-}
        writeVkSemaphore p
          = pokeByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, semaphore}

instance {-# OVERLAPPING #-}
         HasField "semaphore" VkImportSemaphoreWin32HandleInfoKHR where
        type FieldType "semaphore" VkImportSemaphoreWin32HandleInfoKHR =
             VkSemaphore
        type FieldOptional "semaphore" VkImportSemaphoreWin32HandleInfoKHR
             = 'False -- ' closing tick for hsc2hs
        type FieldOffset "semaphore" VkImportSemaphoreWin32HandleInfoKHR =
             #{offset VkImportSemaphoreWin32HandleInfoKHR, semaphore}
        type FieldIsArray "semaphore" VkImportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, semaphore}

instance CanReadField "semaphore"
           VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkSemaphore

        {-# INLINE readField #-}
        readField = readVkSemaphore

instance CanWriteField "semaphore"
           VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkSemaphore

instance {-# OVERLAPPING #-}
         HasVkFlags VkImportSemaphoreWin32HandleInfoKHR where
        type VkFlagsMType VkImportSemaphoreWin32HandleInfoKHR =
             VkSemaphoreImportFlagsKHR

        {-# NOINLINE vkFlags #-}
        vkFlags x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImportSemaphoreWin32HandleInfoKHR, flags})

        {-# INLINE vkFlagsByteOffset #-}
        vkFlagsByteOffset ~_
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, flags}

        {-# INLINE readVkFlags #-}
        readVkFlags p
          = peekByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, flags}

        {-# INLINE writeVkFlags #-}
        writeVkFlags p
          = pokeByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, flags}

instance {-# OVERLAPPING #-}
         HasField "flags" VkImportSemaphoreWin32HandleInfoKHR where
        type FieldType "flags" VkImportSemaphoreWin32HandleInfoKHR =
             VkSemaphoreImportFlagsKHR
        type FieldOptional "flags" VkImportSemaphoreWin32HandleInfoKHR =
             'True -- ' closing tick for hsc2hs
        type FieldOffset "flags" VkImportSemaphoreWin32HandleInfoKHR =
             #{offset VkImportSemaphoreWin32HandleInfoKHR, flags}
        type FieldIsArray "flags" VkImportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = True

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, flags}

instance CanReadField "flags" VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkFlags

        {-# INLINE readField #-}
        readField = readVkFlags

instance CanWriteField "flags" VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkFlags

instance {-# OVERLAPPING #-}
         HasVkHandleType VkImportSemaphoreWin32HandleInfoKHR where
        type VkHandleTypeMType VkImportSemaphoreWin32HandleInfoKHR =
             VkExternalSemaphoreHandleTypeFlagBitsKHR

        {-# NOINLINE vkHandleType #-}
        vkHandleType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImportSemaphoreWin32HandleInfoKHR, handleType})

        {-# INLINE vkHandleTypeByteOffset #-}
        vkHandleTypeByteOffset ~_
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, handleType}

        {-# INLINE readVkHandleType #-}
        readVkHandleType p
          = peekByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, handleType}

        {-# INLINE writeVkHandleType #-}
        writeVkHandleType p
          = pokeByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, handleType}

instance {-# OVERLAPPING #-}
         HasField "handleType" VkImportSemaphoreWin32HandleInfoKHR where
        type FieldType "handleType" VkImportSemaphoreWin32HandleInfoKHR =
             VkExternalSemaphoreHandleTypeFlagBitsKHR
        type FieldOptional "handleType" VkImportSemaphoreWin32HandleInfoKHR
             = 'True -- ' closing tick for hsc2hs
        type FieldOffset "handleType" VkImportSemaphoreWin32HandleInfoKHR =
             #{offset VkImportSemaphoreWin32HandleInfoKHR, handleType}
        type FieldIsArray "handleType" VkImportSemaphoreWin32HandleInfoKHR
             = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = True

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, handleType}

instance CanReadField "handleType"
           VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkHandleType

        {-# INLINE readField #-}
        readField = readVkHandleType

instance CanWriteField "handleType"
           VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkHandleType

instance {-# OVERLAPPING #-}
         HasVkHandle VkImportSemaphoreWin32HandleInfoKHR where
        type VkHandleMType VkImportSemaphoreWin32HandleInfoKHR = HANDLE

        {-# NOINLINE vkHandle #-}
        vkHandle x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImportSemaphoreWin32HandleInfoKHR, handle})

        {-# INLINE vkHandleByteOffset #-}
        vkHandleByteOffset ~_
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, handle}

        {-# INLINE readVkHandle #-}
        readVkHandle p
          = peekByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, handle}

        {-# INLINE writeVkHandle #-}
        writeVkHandle p
          = pokeByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, handle}

instance {-# OVERLAPPING #-}
         HasField "handle" VkImportSemaphoreWin32HandleInfoKHR where
        type FieldType "handle" VkImportSemaphoreWin32HandleInfoKHR =
             HANDLE
        type FieldOptional "handle" VkImportSemaphoreWin32HandleInfoKHR =
             'True -- ' closing tick for hsc2hs
        type FieldOffset "handle" VkImportSemaphoreWin32HandleInfoKHR =
             #{offset VkImportSemaphoreWin32HandleInfoKHR, handle}
        type FieldIsArray "handle" VkImportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = True

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, handle}

instance CanReadField "handle" VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkHandle

        {-# INLINE readField #-}
        readField = readVkHandle

instance CanWriteField "handle" VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkHandle

instance {-# OVERLAPPING #-}
         HasVkName VkImportSemaphoreWin32HandleInfoKHR where
        type VkNameMType VkImportSemaphoreWin32HandleInfoKHR = LPCWSTR

        {-# NOINLINE vkName #-}
        vkName x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImportSemaphoreWin32HandleInfoKHR, name})

        {-# INLINE vkNameByteOffset #-}
        vkNameByteOffset ~_
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, name}

        {-# INLINE readVkName #-}
        readVkName p
          = peekByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, name}

        {-# INLINE writeVkName #-}
        writeVkName p
          = pokeByteOff p #{offset VkImportSemaphoreWin32HandleInfoKHR, name}

instance {-# OVERLAPPING #-}
         HasField "name" VkImportSemaphoreWin32HandleInfoKHR where
        type FieldType "name" VkImportSemaphoreWin32HandleInfoKHR = LPCWSTR
        type FieldOptional "name" VkImportSemaphoreWin32HandleInfoKHR =
             'True -- ' closing tick for hsc2hs
        type FieldOffset "name" VkImportSemaphoreWin32HandleInfoKHR =
             #{offset VkImportSemaphoreWin32HandleInfoKHR, name}
        type FieldIsArray "name" VkImportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = True

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkImportSemaphoreWin32HandleInfoKHR, name}

instance CanReadField "name" VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkName

        {-# INLINE readField #-}
        readField = readVkName

instance CanWriteField "name" VkImportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkName

instance Show VkImportSemaphoreWin32HandleInfoKHR where
        showsPrec d x
          = showString "VkImportSemaphoreWin32HandleInfoKHR {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkSemaphore = " .
                            showsPrec d (vkSemaphore x) .
                              showString ", " .
                                showString "vkFlags = " .
                                  showsPrec d (vkFlags x) .
                                    showString ", " .
                                      showString "vkHandleType = " .
                                        showsPrec d (vkHandleType x) .
                                          showString ", " .
                                            showString "vkHandle = " .
                                              showsPrec d (vkHandle x) .
                                                showString ", " .
                                                  showString "vkName = " .
                                                    showsPrec d (vkName x) . showChar '}'

-- | > typedef struct VkExportSemaphoreWin32HandleInfoKHR {
--   >     VkStructureType sType;
--   >     const void*                      pNext;
--   >     const SECURITY_ATTRIBUTES*       pAttributes;
--   >     DWORD                            dwAccess;
--   >     LPCWSTR                          name;
--   > } VkExportSemaphoreWin32HandleInfoKHR;
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/man/html/VkExportSemaphoreWin32HandleInfoKHR.html VkExportSemaphoreWin32HandleInfoKHR registry at www.khronos.org>
data VkExportSemaphoreWin32HandleInfoKHR = VkExportSemaphoreWin32HandleInfoKHR## Addr##
                                                                                ByteArray##

instance Eq VkExportSemaphoreWin32HandleInfoKHR where
        (VkExportSemaphoreWin32HandleInfoKHR## a _) ==
          x@(VkExportSemaphoreWin32HandleInfoKHR## b _)
          = EQ == cmpBytes## (sizeOf x) a b

        {-# INLINE (==) #-}

instance Ord VkExportSemaphoreWin32HandleInfoKHR where
        (VkExportSemaphoreWin32HandleInfoKHR## a _) `compare`
          x@(VkExportSemaphoreWin32HandleInfoKHR## b _)
          = cmpBytes## (sizeOf x) a b

        {-# INLINE compare #-}

instance Storable VkExportSemaphoreWin32HandleInfoKHR where
        sizeOf ~_ = #{size VkExportSemaphoreWin32HandleInfoKHR}

        {-# INLINE sizeOf #-}
        alignment ~_
          = #{alignment VkExportSemaphoreWin32HandleInfoKHR}

        {-# INLINE alignment #-}
        peek = peekVkData##

        {-# INLINE peek #-}
        poke = pokeVkData##

        {-# INLINE poke #-}

instance VulkanMarshalPrim VkExportSemaphoreWin32HandleInfoKHR
         where
        unsafeAddr (VkExportSemaphoreWin32HandleInfoKHR## a _) = a

        {-# INLINE unsafeAddr #-}
        unsafeByteArray (VkExportSemaphoreWin32HandleInfoKHR## _ b) = b

        {-# INLINE unsafeByteArray #-}
        unsafeFromByteArrayOffset off b
          = VkExportSemaphoreWin32HandleInfoKHR##
              (plusAddr## (byteArrayContents## b) off)
              b

        {-# INLINE unsafeFromByteArrayOffset #-}

instance VulkanMarshal VkExportSemaphoreWin32HandleInfoKHR where
        type StructFields VkExportSemaphoreWin32HandleInfoKHR =
             '["sType", "pNext", "pAttributes", "dwAccess", "name"] -- ' closing tick for hsc2hs
        type CUnionType VkExportSemaphoreWin32HandleInfoKHR = 'False -- ' closing tick for hsc2hs
        type ReturnedOnly VkExportSemaphoreWin32HandleInfoKHR = 'False -- ' closing tick for hsc2hs
        type StructExtends VkExportSemaphoreWin32HandleInfoKHR =
             '[VkSemaphoreCreateInfo] -- ' closing tick for hsc2hs

instance {-# OVERLAPPING #-}
         HasVkSType VkExportSemaphoreWin32HandleInfoKHR where
        type VkSTypeMType VkExportSemaphoreWin32HandleInfoKHR =
             VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkExportSemaphoreWin32HandleInfoKHR, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkExportSemaphoreWin32HandleInfoKHR, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkExportSemaphoreWin32HandleInfoKHR, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkExportSemaphoreWin32HandleInfoKHR, sType}

instance {-# OVERLAPPING #-}
         HasField "sType" VkExportSemaphoreWin32HandleInfoKHR where
        type FieldType "sType" VkExportSemaphoreWin32HandleInfoKHR =
             VkStructureType
        type FieldOptional "sType" VkExportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs
        type FieldOffset "sType" VkExportSemaphoreWin32HandleInfoKHR =
             #{offset VkExportSemaphoreWin32HandleInfoKHR, sType}
        type FieldIsArray "sType" VkExportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkExportSemaphoreWin32HandleInfoKHR, sType}

instance CanReadField "sType" VkExportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkSType

        {-# INLINE readField #-}
        readField = readVkSType

instance CanWriteField "sType" VkExportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkSType

instance {-# OVERLAPPING #-}
         HasVkPNext VkExportSemaphoreWin32HandleInfoKHR where
        type VkPNextMType VkExportSemaphoreWin32HandleInfoKHR = Ptr Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkExportSemaphoreWin32HandleInfoKHR, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkExportSemaphoreWin32HandleInfoKHR, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkExportSemaphoreWin32HandleInfoKHR, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkExportSemaphoreWin32HandleInfoKHR, pNext}

instance {-# OVERLAPPING #-}
         HasField "pNext" VkExportSemaphoreWin32HandleInfoKHR where
        type FieldType "pNext" VkExportSemaphoreWin32HandleInfoKHR =
             Ptr Void
        type FieldOptional "pNext" VkExportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs
        type FieldOffset "pNext" VkExportSemaphoreWin32HandleInfoKHR =
             #{offset VkExportSemaphoreWin32HandleInfoKHR, pNext}
        type FieldIsArray "pNext" VkExportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkExportSemaphoreWin32HandleInfoKHR, pNext}

instance CanReadField "pNext" VkExportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkPNext

        {-# INLINE readField #-}
        readField = readVkPNext

instance CanWriteField "pNext" VkExportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkPNext

instance {-# OVERLAPPING #-}
         HasVkPAttributes VkExportSemaphoreWin32HandleInfoKHR where
        type VkPAttributesMType VkExportSemaphoreWin32HandleInfoKHR =
             Ptr SECURITY_ATTRIBUTES

        {-# NOINLINE vkPAttributes #-}
        vkPAttributes x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkExportSemaphoreWin32HandleInfoKHR, pAttributes})

        {-# INLINE vkPAttributesByteOffset #-}
        vkPAttributesByteOffset ~_
          = #{offset VkExportSemaphoreWin32HandleInfoKHR, pAttributes}

        {-# INLINE readVkPAttributes #-}
        readVkPAttributes p
          = peekByteOff p #{offset VkExportSemaphoreWin32HandleInfoKHR, pAttributes}

        {-# INLINE writeVkPAttributes #-}
        writeVkPAttributes p
          = pokeByteOff p #{offset VkExportSemaphoreWin32HandleInfoKHR, pAttributes}

instance {-# OVERLAPPING #-}
         HasField "pAttributes" VkExportSemaphoreWin32HandleInfoKHR where
        type FieldType "pAttributes" VkExportSemaphoreWin32HandleInfoKHR =
             Ptr SECURITY_ATTRIBUTES
        type FieldOptional "pAttributes"
               VkExportSemaphoreWin32HandleInfoKHR
             = 'True -- ' closing tick for hsc2hs
        type FieldOffset "pAttributes" VkExportSemaphoreWin32HandleInfoKHR
             =
             #{offset VkExportSemaphoreWin32HandleInfoKHR, pAttributes}
        type FieldIsArray "pAttributes" VkExportSemaphoreWin32HandleInfoKHR
             = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = True

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkExportSemaphoreWin32HandleInfoKHR, pAttributes}

instance CanReadField "pAttributes"
           VkExportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkPAttributes

        {-# INLINE readField #-}
        readField = readVkPAttributes

instance CanWriteField "pAttributes"
           VkExportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkPAttributes

instance {-# OVERLAPPING #-}
         HasVkDwAccess VkExportSemaphoreWin32HandleInfoKHR where
        type VkDwAccessMType VkExportSemaphoreWin32HandleInfoKHR = DWORD

        {-# NOINLINE vkDwAccess #-}
        vkDwAccess x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkExportSemaphoreWin32HandleInfoKHR, dwAccess})

        {-# INLINE vkDwAccessByteOffset #-}
        vkDwAccessByteOffset ~_
          = #{offset VkExportSemaphoreWin32HandleInfoKHR, dwAccess}

        {-# INLINE readVkDwAccess #-}
        readVkDwAccess p
          = peekByteOff p #{offset VkExportSemaphoreWin32HandleInfoKHR, dwAccess}

        {-# INLINE writeVkDwAccess #-}
        writeVkDwAccess p
          = pokeByteOff p #{offset VkExportSemaphoreWin32HandleInfoKHR, dwAccess}

instance {-# OVERLAPPING #-}
         HasField "dwAccess" VkExportSemaphoreWin32HandleInfoKHR where
        type FieldType "dwAccess" VkExportSemaphoreWin32HandleInfoKHR =
             DWORD
        type FieldOptional "dwAccess" VkExportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs
        type FieldOffset "dwAccess" VkExportSemaphoreWin32HandleInfoKHR =
             #{offset VkExportSemaphoreWin32HandleInfoKHR, dwAccess}
        type FieldIsArray "dwAccess" VkExportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkExportSemaphoreWin32HandleInfoKHR, dwAccess}

instance CanReadField "dwAccess"
           VkExportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkDwAccess

        {-# INLINE readField #-}
        readField = readVkDwAccess

instance CanWriteField "dwAccess"
           VkExportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkDwAccess

instance {-# OVERLAPPING #-}
         HasVkName VkExportSemaphoreWin32HandleInfoKHR where
        type VkNameMType VkExportSemaphoreWin32HandleInfoKHR = LPCWSTR

        {-# NOINLINE vkName #-}
        vkName x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkExportSemaphoreWin32HandleInfoKHR, name})

        {-# INLINE vkNameByteOffset #-}
        vkNameByteOffset ~_
          = #{offset VkExportSemaphoreWin32HandleInfoKHR, name}

        {-# INLINE readVkName #-}
        readVkName p
          = peekByteOff p #{offset VkExportSemaphoreWin32HandleInfoKHR, name}

        {-# INLINE writeVkName #-}
        writeVkName p
          = pokeByteOff p #{offset VkExportSemaphoreWin32HandleInfoKHR, name}

instance {-# OVERLAPPING #-}
         HasField "name" VkExportSemaphoreWin32HandleInfoKHR where
        type FieldType "name" VkExportSemaphoreWin32HandleInfoKHR = LPCWSTR
        type FieldOptional "name" VkExportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs
        type FieldOffset "name" VkExportSemaphoreWin32HandleInfoKHR =
             #{offset VkExportSemaphoreWin32HandleInfoKHR, name}
        type FieldIsArray "name" VkExportSemaphoreWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkExportSemaphoreWin32HandleInfoKHR, name}

instance CanReadField "name" VkExportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkName

        {-# INLINE readField #-}
        readField = readVkName

instance CanWriteField "name" VkExportSemaphoreWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkName

instance Show VkExportSemaphoreWin32HandleInfoKHR where
        showsPrec d x
          = showString "VkExportSemaphoreWin32HandleInfoKHR {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkPAttributes = " .
                            showsPrec d (vkPAttributes x) .
                              showString ", " .
                                showString "vkDwAccess = " .
                                  showsPrec d (vkDwAccess x) .
                                    showString ", " .
                                      showString "vkName = " . showsPrec d (vkName x) . showChar '}'

-- | > typedef struct VkD3D12FenceSubmitInfoKHR {
--   >     VkStructureType sType;
--   >     const void*                      pNext;
--   >     uint32_t         waitSemaphoreValuesCount;
--   >     const uint64_t* pWaitSemaphoreValues;
--   >     uint32_t         signalSemaphoreValuesCount;
--   >     const uint64_t* pSignalSemaphoreValues;
--   > } VkD3D12FenceSubmitInfoKHR;
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/man/html/VkD3D12FenceSubmitInfoKHR.html VkD3D12FenceSubmitInfoKHR registry at www.khronos.org>
data VkD3D12FenceSubmitInfoKHR = VkD3D12FenceSubmitInfoKHR## Addr##
                                                            ByteArray##

instance Eq VkD3D12FenceSubmitInfoKHR where
        (VkD3D12FenceSubmitInfoKHR## a _) ==
          x@(VkD3D12FenceSubmitInfoKHR## b _) = EQ == cmpBytes## (sizeOf x) a b

        {-# INLINE (==) #-}

instance Ord VkD3D12FenceSubmitInfoKHR where
        (VkD3D12FenceSubmitInfoKHR## a _) `compare`
          x@(VkD3D12FenceSubmitInfoKHR## b _) = cmpBytes## (sizeOf x) a b

        {-# INLINE compare #-}

instance Storable VkD3D12FenceSubmitInfoKHR where
        sizeOf ~_ = #{size VkD3D12FenceSubmitInfoKHR}

        {-# INLINE sizeOf #-}
        alignment ~_ = #{alignment VkD3D12FenceSubmitInfoKHR}

        {-# INLINE alignment #-}
        peek = peekVkData##

        {-# INLINE peek #-}
        poke = pokeVkData##

        {-# INLINE poke #-}

instance VulkanMarshalPrim VkD3D12FenceSubmitInfoKHR where
        unsafeAddr (VkD3D12FenceSubmitInfoKHR## a _) = a

        {-# INLINE unsafeAddr #-}
        unsafeByteArray (VkD3D12FenceSubmitInfoKHR## _ b) = b

        {-# INLINE unsafeByteArray #-}
        unsafeFromByteArrayOffset off b
          = VkD3D12FenceSubmitInfoKHR## (plusAddr## (byteArrayContents## b) off)
              b

        {-# INLINE unsafeFromByteArrayOffset #-}

instance VulkanMarshal VkD3D12FenceSubmitInfoKHR where
        type StructFields VkD3D12FenceSubmitInfoKHR =
             '["sType", "pNext", "waitSemaphoreValuesCount", -- ' closing tick for hsc2hs
               "pWaitSemaphoreValues", "signalSemaphoreValuesCount",
               "pSignalSemaphoreValues"]
        type CUnionType VkD3D12FenceSubmitInfoKHR = 'False -- ' closing tick for hsc2hs
        type ReturnedOnly VkD3D12FenceSubmitInfoKHR = 'False -- ' closing tick for hsc2hs
        type StructExtends VkD3D12FenceSubmitInfoKHR = '[VkSubmitInfo] -- ' closing tick for hsc2hs

instance {-# OVERLAPPING #-} HasVkSType VkD3D12FenceSubmitInfoKHR
         where
        type VkSTypeMType VkD3D12FenceSubmitInfoKHR = VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkD3D12FenceSubmitInfoKHR, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkD3D12FenceSubmitInfoKHR, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkD3D12FenceSubmitInfoKHR, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkD3D12FenceSubmitInfoKHR, sType}

instance {-# OVERLAPPING #-}
         HasField "sType" VkD3D12FenceSubmitInfoKHR where
        type FieldType "sType" VkD3D12FenceSubmitInfoKHR = VkStructureType
        type FieldOptional "sType" VkD3D12FenceSubmitInfoKHR = 'False -- ' closing tick for hsc2hs
        type FieldOffset "sType" VkD3D12FenceSubmitInfoKHR =
             #{offset VkD3D12FenceSubmitInfoKHR, sType}
        type FieldIsArray "sType" VkD3D12FenceSubmitInfoKHR = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkD3D12FenceSubmitInfoKHR, sType}

instance CanReadField "sType" VkD3D12FenceSubmitInfoKHR where
        {-# INLINE getField #-}
        getField = vkSType

        {-# INLINE readField #-}
        readField = readVkSType

instance CanWriteField "sType" VkD3D12FenceSubmitInfoKHR where
        {-# INLINE writeField #-}
        writeField = writeVkSType

instance {-# OVERLAPPING #-} HasVkPNext VkD3D12FenceSubmitInfoKHR
         where
        type VkPNextMType VkD3D12FenceSubmitInfoKHR = Ptr Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkD3D12FenceSubmitInfoKHR, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkD3D12FenceSubmitInfoKHR, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkD3D12FenceSubmitInfoKHR, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkD3D12FenceSubmitInfoKHR, pNext}

instance {-# OVERLAPPING #-}
         HasField "pNext" VkD3D12FenceSubmitInfoKHR where
        type FieldType "pNext" VkD3D12FenceSubmitInfoKHR = Ptr Void
        type FieldOptional "pNext" VkD3D12FenceSubmitInfoKHR = 'False -- ' closing tick for hsc2hs
        type FieldOffset "pNext" VkD3D12FenceSubmitInfoKHR =
             #{offset VkD3D12FenceSubmitInfoKHR, pNext}
        type FieldIsArray "pNext" VkD3D12FenceSubmitInfoKHR = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkD3D12FenceSubmitInfoKHR, pNext}

instance CanReadField "pNext" VkD3D12FenceSubmitInfoKHR where
        {-# INLINE getField #-}
        getField = vkPNext

        {-# INLINE readField #-}
        readField = readVkPNext

instance CanWriteField "pNext" VkD3D12FenceSubmitInfoKHR where
        {-# INLINE writeField #-}
        writeField = writeVkPNext

instance {-# OVERLAPPING #-}
         HasVkWaitSemaphoreValuesCount VkD3D12FenceSubmitInfoKHR where
        type VkWaitSemaphoreValuesCountMType VkD3D12FenceSubmitInfoKHR =
             Word32

        {-# NOINLINE vkWaitSemaphoreValuesCount #-}
        vkWaitSemaphoreValuesCount x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkD3D12FenceSubmitInfoKHR, waitSemaphoreValuesCount})

        {-# INLINE vkWaitSemaphoreValuesCountByteOffset #-}
        vkWaitSemaphoreValuesCountByteOffset ~_
          = #{offset VkD3D12FenceSubmitInfoKHR, waitSemaphoreValuesCount}

        {-# INLINE readVkWaitSemaphoreValuesCount #-}
        readVkWaitSemaphoreValuesCount p
          = peekByteOff p #{offset VkD3D12FenceSubmitInfoKHR, waitSemaphoreValuesCount}

        {-# INLINE writeVkWaitSemaphoreValuesCount #-}
        writeVkWaitSemaphoreValuesCount p
          = pokeByteOff p #{offset VkD3D12FenceSubmitInfoKHR, waitSemaphoreValuesCount}

instance {-# OVERLAPPING #-}
         HasField "waitSemaphoreValuesCount" VkD3D12FenceSubmitInfoKHR where
        type FieldType "waitSemaphoreValuesCount" VkD3D12FenceSubmitInfoKHR
             = Word32
        type FieldOptional "waitSemaphoreValuesCount"
               VkD3D12FenceSubmitInfoKHR
             = 'True -- ' closing tick for hsc2hs
        type FieldOffset "waitSemaphoreValuesCount"
               VkD3D12FenceSubmitInfoKHR
             =
             #{offset VkD3D12FenceSubmitInfoKHR, waitSemaphoreValuesCount}
        type FieldIsArray "waitSemaphoreValuesCount"
               VkD3D12FenceSubmitInfoKHR
             = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = True

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkD3D12FenceSubmitInfoKHR, waitSemaphoreValuesCount}

instance CanReadField "waitSemaphoreValuesCount"
           VkD3D12FenceSubmitInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkWaitSemaphoreValuesCount

        {-# INLINE readField #-}
        readField = readVkWaitSemaphoreValuesCount

instance CanWriteField "waitSemaphoreValuesCount"
           VkD3D12FenceSubmitInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkWaitSemaphoreValuesCount

instance {-# OVERLAPPING #-}
         HasVkPWaitSemaphoreValues VkD3D12FenceSubmitInfoKHR where
        type VkPWaitSemaphoreValuesMType VkD3D12FenceSubmitInfoKHR =
             Ptr Word64

        {-# NOINLINE vkPWaitSemaphoreValues #-}
        vkPWaitSemaphoreValues x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkD3D12FenceSubmitInfoKHR, pWaitSemaphoreValues})

        {-# INLINE vkPWaitSemaphoreValuesByteOffset #-}
        vkPWaitSemaphoreValuesByteOffset ~_
          = #{offset VkD3D12FenceSubmitInfoKHR, pWaitSemaphoreValues}

        {-# INLINE readVkPWaitSemaphoreValues #-}
        readVkPWaitSemaphoreValues p
          = peekByteOff p #{offset VkD3D12FenceSubmitInfoKHR, pWaitSemaphoreValues}

        {-# INLINE writeVkPWaitSemaphoreValues #-}
        writeVkPWaitSemaphoreValues p
          = pokeByteOff p #{offset VkD3D12FenceSubmitInfoKHR, pWaitSemaphoreValues}

instance {-# OVERLAPPING #-}
         HasField "pWaitSemaphoreValues" VkD3D12FenceSubmitInfoKHR where
        type FieldType "pWaitSemaphoreValues" VkD3D12FenceSubmitInfoKHR =
             Ptr Word64
        type FieldOptional "pWaitSemaphoreValues" VkD3D12FenceSubmitInfoKHR
             = 'True -- ' closing tick for hsc2hs
        type FieldOffset "pWaitSemaphoreValues" VkD3D12FenceSubmitInfoKHR =
             #{offset VkD3D12FenceSubmitInfoKHR, pWaitSemaphoreValues}
        type FieldIsArray "pWaitSemaphoreValues" VkD3D12FenceSubmitInfoKHR
             = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = True

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkD3D12FenceSubmitInfoKHR, pWaitSemaphoreValues}

instance CanReadField "pWaitSemaphoreValues"
           VkD3D12FenceSubmitInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkPWaitSemaphoreValues

        {-# INLINE readField #-}
        readField = readVkPWaitSemaphoreValues

instance CanWriteField "pWaitSemaphoreValues"
           VkD3D12FenceSubmitInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkPWaitSemaphoreValues

instance {-# OVERLAPPING #-}
         HasVkSignalSemaphoreValuesCount VkD3D12FenceSubmitInfoKHR where
        type VkSignalSemaphoreValuesCountMType VkD3D12FenceSubmitInfoKHR =
             Word32

        {-# NOINLINE vkSignalSemaphoreValuesCount #-}
        vkSignalSemaphoreValuesCount x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkD3D12FenceSubmitInfoKHR, signalSemaphoreValuesCount})

        {-# INLINE vkSignalSemaphoreValuesCountByteOffset #-}
        vkSignalSemaphoreValuesCountByteOffset ~_
          = #{offset VkD3D12FenceSubmitInfoKHR, signalSemaphoreValuesCount}

        {-# INLINE readVkSignalSemaphoreValuesCount #-}
        readVkSignalSemaphoreValuesCount p
          = peekByteOff p #{offset VkD3D12FenceSubmitInfoKHR, signalSemaphoreValuesCount}

        {-# INLINE writeVkSignalSemaphoreValuesCount #-}
        writeVkSignalSemaphoreValuesCount p
          = pokeByteOff p #{offset VkD3D12FenceSubmitInfoKHR, signalSemaphoreValuesCount}

instance {-# OVERLAPPING #-}
         HasField "signalSemaphoreValuesCount" VkD3D12FenceSubmitInfoKHR
         where
        type FieldType "signalSemaphoreValuesCount"
               VkD3D12FenceSubmitInfoKHR
             = Word32
        type FieldOptional "signalSemaphoreValuesCount"
               VkD3D12FenceSubmitInfoKHR
             = 'True -- ' closing tick for hsc2hs
        type FieldOffset "signalSemaphoreValuesCount"
               VkD3D12FenceSubmitInfoKHR
             =
             #{offset VkD3D12FenceSubmitInfoKHR, signalSemaphoreValuesCount}
        type FieldIsArray "signalSemaphoreValuesCount"
               VkD3D12FenceSubmitInfoKHR
             = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = True

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkD3D12FenceSubmitInfoKHR, signalSemaphoreValuesCount}

instance CanReadField "signalSemaphoreValuesCount"
           VkD3D12FenceSubmitInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkSignalSemaphoreValuesCount

        {-# INLINE readField #-}
        readField = readVkSignalSemaphoreValuesCount

instance CanWriteField "signalSemaphoreValuesCount"
           VkD3D12FenceSubmitInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkSignalSemaphoreValuesCount

instance {-# OVERLAPPING #-}
         HasVkPSignalSemaphoreValues VkD3D12FenceSubmitInfoKHR where
        type VkPSignalSemaphoreValuesMType VkD3D12FenceSubmitInfoKHR =
             Ptr Word64

        {-# NOINLINE vkPSignalSemaphoreValues #-}
        vkPSignalSemaphoreValues x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkD3D12FenceSubmitInfoKHR, pSignalSemaphoreValues})

        {-# INLINE vkPSignalSemaphoreValuesByteOffset #-}
        vkPSignalSemaphoreValuesByteOffset ~_
          = #{offset VkD3D12FenceSubmitInfoKHR, pSignalSemaphoreValues}

        {-# INLINE readVkPSignalSemaphoreValues #-}
        readVkPSignalSemaphoreValues p
          = peekByteOff p #{offset VkD3D12FenceSubmitInfoKHR, pSignalSemaphoreValues}

        {-# INLINE writeVkPSignalSemaphoreValues #-}
        writeVkPSignalSemaphoreValues p
          = pokeByteOff p #{offset VkD3D12FenceSubmitInfoKHR, pSignalSemaphoreValues}

instance {-# OVERLAPPING #-}
         HasField "pSignalSemaphoreValues" VkD3D12FenceSubmitInfoKHR where
        type FieldType "pSignalSemaphoreValues" VkD3D12FenceSubmitInfoKHR =
             Ptr Word64
        type FieldOptional "pSignalSemaphoreValues"
               VkD3D12FenceSubmitInfoKHR
             = 'True -- ' closing tick for hsc2hs
        type FieldOffset "pSignalSemaphoreValues" VkD3D12FenceSubmitInfoKHR
             =
             #{offset VkD3D12FenceSubmitInfoKHR, pSignalSemaphoreValues}
        type FieldIsArray "pSignalSemaphoreValues"
               VkD3D12FenceSubmitInfoKHR
             = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = True

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkD3D12FenceSubmitInfoKHR, pSignalSemaphoreValues}

instance CanReadField "pSignalSemaphoreValues"
           VkD3D12FenceSubmitInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkPSignalSemaphoreValues

        {-# INLINE readField #-}
        readField = readVkPSignalSemaphoreValues

instance CanWriteField "pSignalSemaphoreValues"
           VkD3D12FenceSubmitInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkPSignalSemaphoreValues

instance Show VkD3D12FenceSubmitInfoKHR where
        showsPrec d x
          = showString "VkD3D12FenceSubmitInfoKHR {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkWaitSemaphoreValuesCount = " .
                            showsPrec d (vkWaitSemaphoreValuesCount x) .
                              showString ", " .
                                showString "vkPWaitSemaphoreValues = " .
                                  showsPrec d (vkPWaitSemaphoreValues x) .
                                    showString ", " .
                                      showString "vkSignalSemaphoreValuesCount = " .
                                        showsPrec d (vkSignalSemaphoreValuesCount x) .
                                          showString ", " .
                                            showString "vkPSignalSemaphoreValues = " .
                                              showsPrec d (vkPSignalSemaphoreValues x) .
                                                showChar '}'

-- | > typedef struct VkSemaphoreGetWin32HandleInfoKHR {
--   >     VkStructureType sType;
--   >     const void*                      pNext;
--   >     VkSemaphore                      semaphore;
--   >     VkExternalSemaphoreHandleTypeFlagBitsKHR handleType;
--   > } VkSemaphoreGetWin32HandleInfoKHR;
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/man/html/VkSemaphoreGetWin32HandleInfoKHR.html VkSemaphoreGetWin32HandleInfoKHR registry at www.khronos.org>
data VkSemaphoreGetWin32HandleInfoKHR = VkSemaphoreGetWin32HandleInfoKHR## Addr##
                                                                          ByteArray##

instance Eq VkSemaphoreGetWin32HandleInfoKHR where
        (VkSemaphoreGetWin32HandleInfoKHR## a _) ==
          x@(VkSemaphoreGetWin32HandleInfoKHR## b _)
          = EQ == cmpBytes## (sizeOf x) a b

        {-# INLINE (==) #-}

instance Ord VkSemaphoreGetWin32HandleInfoKHR where
        (VkSemaphoreGetWin32HandleInfoKHR## a _) `compare`
          x@(VkSemaphoreGetWin32HandleInfoKHR## b _)
          = cmpBytes## (sizeOf x) a b

        {-# INLINE compare #-}

instance Storable VkSemaphoreGetWin32HandleInfoKHR where
        sizeOf ~_ = #{size VkSemaphoreGetWin32HandleInfoKHR}

        {-# INLINE sizeOf #-}
        alignment ~_
          = #{alignment VkSemaphoreGetWin32HandleInfoKHR}

        {-# INLINE alignment #-}
        peek = peekVkData##

        {-# INLINE peek #-}
        poke = pokeVkData##

        {-# INLINE poke #-}

instance VulkanMarshalPrim VkSemaphoreGetWin32HandleInfoKHR where
        unsafeAddr (VkSemaphoreGetWin32HandleInfoKHR## a _) = a

        {-# INLINE unsafeAddr #-}
        unsafeByteArray (VkSemaphoreGetWin32HandleInfoKHR## _ b) = b

        {-# INLINE unsafeByteArray #-}
        unsafeFromByteArrayOffset off b
          = VkSemaphoreGetWin32HandleInfoKHR##
              (plusAddr## (byteArrayContents## b) off)
              b

        {-# INLINE unsafeFromByteArrayOffset #-}

instance VulkanMarshal VkSemaphoreGetWin32HandleInfoKHR where
        type StructFields VkSemaphoreGetWin32HandleInfoKHR =
             '["sType", "pNext", "semaphore", "handleType"] -- ' closing tick for hsc2hs
        type CUnionType VkSemaphoreGetWin32HandleInfoKHR = 'False -- ' closing tick for hsc2hs
        type ReturnedOnly VkSemaphoreGetWin32HandleInfoKHR = 'False -- ' closing tick for hsc2hs
        type StructExtends VkSemaphoreGetWin32HandleInfoKHR = '[] -- ' closing tick for hsc2hs

instance {-# OVERLAPPING #-}
         HasVkSType VkSemaphoreGetWin32HandleInfoKHR where
        type VkSTypeMType VkSemaphoreGetWin32HandleInfoKHR =
             VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkSemaphoreGetWin32HandleInfoKHR, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkSemaphoreGetWin32HandleInfoKHR, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkSemaphoreGetWin32HandleInfoKHR, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkSemaphoreGetWin32HandleInfoKHR, sType}

instance {-# OVERLAPPING #-}
         HasField "sType" VkSemaphoreGetWin32HandleInfoKHR where
        type FieldType "sType" VkSemaphoreGetWin32HandleInfoKHR =
             VkStructureType
        type FieldOptional "sType" VkSemaphoreGetWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs
        type FieldOffset "sType" VkSemaphoreGetWin32HandleInfoKHR =
             #{offset VkSemaphoreGetWin32HandleInfoKHR, sType}
        type FieldIsArray "sType" VkSemaphoreGetWin32HandleInfoKHR = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkSemaphoreGetWin32HandleInfoKHR, sType}

instance CanReadField "sType" VkSemaphoreGetWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkSType

        {-# INLINE readField #-}
        readField = readVkSType

instance CanWriteField "sType" VkSemaphoreGetWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkSType

instance {-# OVERLAPPING #-}
         HasVkPNext VkSemaphoreGetWin32HandleInfoKHR where
        type VkPNextMType VkSemaphoreGetWin32HandleInfoKHR = Ptr Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkSemaphoreGetWin32HandleInfoKHR, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkSemaphoreGetWin32HandleInfoKHR, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkSemaphoreGetWin32HandleInfoKHR, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkSemaphoreGetWin32HandleInfoKHR, pNext}

instance {-# OVERLAPPING #-}
         HasField "pNext" VkSemaphoreGetWin32HandleInfoKHR where
        type FieldType "pNext" VkSemaphoreGetWin32HandleInfoKHR = Ptr Void
        type FieldOptional "pNext" VkSemaphoreGetWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs
        type FieldOffset "pNext" VkSemaphoreGetWin32HandleInfoKHR =
             #{offset VkSemaphoreGetWin32HandleInfoKHR, pNext}
        type FieldIsArray "pNext" VkSemaphoreGetWin32HandleInfoKHR = 'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkSemaphoreGetWin32HandleInfoKHR, pNext}

instance CanReadField "pNext" VkSemaphoreGetWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkPNext

        {-# INLINE readField #-}
        readField = readVkPNext

instance CanWriteField "pNext" VkSemaphoreGetWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkPNext

instance {-# OVERLAPPING #-}
         HasVkSemaphore VkSemaphoreGetWin32HandleInfoKHR where
        type VkSemaphoreMType VkSemaphoreGetWin32HandleInfoKHR =
             VkSemaphore

        {-# NOINLINE vkSemaphore #-}
        vkSemaphore x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkSemaphoreGetWin32HandleInfoKHR, semaphore})

        {-# INLINE vkSemaphoreByteOffset #-}
        vkSemaphoreByteOffset ~_
          = #{offset VkSemaphoreGetWin32HandleInfoKHR, semaphore}

        {-# INLINE readVkSemaphore #-}
        readVkSemaphore p
          = peekByteOff p #{offset VkSemaphoreGetWin32HandleInfoKHR, semaphore}

        {-# INLINE writeVkSemaphore #-}
        writeVkSemaphore p
          = pokeByteOff p #{offset VkSemaphoreGetWin32HandleInfoKHR, semaphore}

instance {-# OVERLAPPING #-}
         HasField "semaphore" VkSemaphoreGetWin32HandleInfoKHR where
        type FieldType "semaphore" VkSemaphoreGetWin32HandleInfoKHR =
             VkSemaphore
        type FieldOptional "semaphore" VkSemaphoreGetWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs
        type FieldOffset "semaphore" VkSemaphoreGetWin32HandleInfoKHR =
             #{offset VkSemaphoreGetWin32HandleInfoKHR, semaphore}
        type FieldIsArray "semaphore" VkSemaphoreGetWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkSemaphoreGetWin32HandleInfoKHR, semaphore}

instance CanReadField "semaphore" VkSemaphoreGetWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkSemaphore

        {-# INLINE readField #-}
        readField = readVkSemaphore

instance CanWriteField "semaphore" VkSemaphoreGetWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkSemaphore

instance {-# OVERLAPPING #-}
         HasVkHandleType VkSemaphoreGetWin32HandleInfoKHR where
        type VkHandleTypeMType VkSemaphoreGetWin32HandleInfoKHR =
             VkExternalSemaphoreHandleTypeFlagBitsKHR

        {-# NOINLINE vkHandleType #-}
        vkHandleType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkSemaphoreGetWin32HandleInfoKHR, handleType})

        {-# INLINE vkHandleTypeByteOffset #-}
        vkHandleTypeByteOffset ~_
          = #{offset VkSemaphoreGetWin32HandleInfoKHR, handleType}

        {-# INLINE readVkHandleType #-}
        readVkHandleType p
          = peekByteOff p #{offset VkSemaphoreGetWin32HandleInfoKHR, handleType}

        {-# INLINE writeVkHandleType #-}
        writeVkHandleType p
          = pokeByteOff p #{offset VkSemaphoreGetWin32HandleInfoKHR, handleType}

instance {-# OVERLAPPING #-}
         HasField "handleType" VkSemaphoreGetWin32HandleInfoKHR where
        type FieldType "handleType" VkSemaphoreGetWin32HandleInfoKHR =
             VkExternalSemaphoreHandleTypeFlagBitsKHR
        type FieldOptional "handleType" VkSemaphoreGetWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs
        type FieldOffset "handleType" VkSemaphoreGetWin32HandleInfoKHR =
             #{offset VkSemaphoreGetWin32HandleInfoKHR, handleType}
        type FieldIsArray "handleType" VkSemaphoreGetWin32HandleInfoKHR =
             'False -- ' closing tick for hsc2hs

        {-# INLINE fieldOptional #-}
        fieldOptional = False

        {-# INLINE fieldOffset #-}
        fieldOffset
          = #{offset VkSemaphoreGetWin32HandleInfoKHR, handleType}

instance CanReadField "handleType" VkSemaphoreGetWin32HandleInfoKHR
         where
        {-# INLINE getField #-}
        getField = vkHandleType

        {-# INLINE readField #-}
        readField = readVkHandleType

instance CanWriteField "handleType"
           VkSemaphoreGetWin32HandleInfoKHR
         where
        {-# INLINE writeField #-}
        writeField = writeVkHandleType

instance Show VkSemaphoreGetWin32HandleInfoKHR where
        showsPrec d x
          = showString "VkSemaphoreGetWin32HandleInfoKHR {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkSemaphore = " .
                            showsPrec d (vkSemaphore x) .
                              showString ", " .
                                showString "vkHandleType = " .
                                  showsPrec d (vkHandleType x) . showChar '}'

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_OUT_OF_HOST_MEMORY', 'VK_ERROR_INVALID_EXTERNAL_HANDLE_KHR'.
--
--   > VkResult vkImportSemaphoreWin32HandleKHR
--   >     ( VkDevice device
--   >     , const VkImportSemaphoreWin32HandleInfoKHR* pImportSemaphoreWin32HandleInfo
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/man/html/vkImportSemaphoreWin32HandleKHR.html vkImportSemaphoreWin32HandleKHR registry at www.khronos.org>
foreign import ccall unsafe "vkImportSemaphoreWin32HandleKHR"
               vkImportSemaphoreWin32HandleKHR ::
               VkDevice -- ^ device
                        -> Ptr VkImportSemaphoreWin32HandleInfoKHR -- ^ pImportSemaphoreWin32HandleInfo
                                                                   -> IO VkResult

-- | Success codes: 'VK_SUCCESS'.
--
--   Error codes: 'VK_ERROR_TOO_MANY_OBJECTS', 'VK_ERROR_OUT_OF_HOST_MEMORY'.
--
--   > VkResult vkGetSemaphoreWin32HandleKHR
--   >     ( VkDevice device
--   >     , const VkSemaphoreGetWin32HandleInfoKHR* pGetWin32HandleInfo
--   >     , HANDLE* pHandle
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/man/html/vkGetSemaphoreWin32HandleKHR.html vkGetSemaphoreWin32HandleKHR registry at www.khronos.org>
foreign import ccall unsafe "vkGetSemaphoreWin32HandleKHR"
               vkGetSemaphoreWin32HandleKHR ::
               VkDevice -- ^ device
                        ->
                 Ptr VkSemaphoreGetWin32HandleInfoKHR -- ^ pGetWin32HandleInfo
                                                      -> Ptr HANDLE -- ^ pHandle
                                                                    -> IO VkResult

pattern VK_KHR_EXTERNAL_SEMAPHORE_WIN32_SPEC_VERSION ::
        (Num a, Eq a) => a

pattern VK_KHR_EXTERNAL_SEMAPHORE_WIN32_SPEC_VERSION = 1

type VK_KHR_EXTERNAL_SEMAPHORE_WIN32_SPEC_VERSION = 1

pattern VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME :: CString

pattern VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME <-
        (is_VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME -> True)
  where VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME
          = _VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME

{-# INLINE _VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME #-}

_VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME :: CString
_VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME
  = Ptr "VK_KHR_external_semaphore_win32\NUL"##

{-# INLINE is_VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME #-}

is_VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME ::
                                                  CString -> Bool
is_VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME
  = eqCStrings _VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME

type VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME =
     "VK_KHR_external_semaphore_win32"

pattern VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR ::
        VkStructureType

pattern VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR =
        VkStructureType 1000078000

pattern VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR ::
        VkStructureType

pattern VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR =
        VkStructureType 1000078001

pattern VK_STRUCTURE_TYPE_D3D12_FENCE_SUBMIT_INFO_KHR ::
        VkStructureType

pattern VK_STRUCTURE_TYPE_D3D12_FENCE_SUBMIT_INFO_KHR =
        VkStructureType 1000078002

pattern VK_STRUCTURE_TYPE_SEMAPHORE_GET_WIN32_HANDLE_INFO_KHR ::
        VkStructureType

pattern VK_STRUCTURE_TYPE_SEMAPHORE_GET_WIN32_HANDLE_INFO_KHR =
        VkStructureType 1000078003
