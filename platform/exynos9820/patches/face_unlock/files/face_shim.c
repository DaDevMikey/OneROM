
#include <stdbool.h>
#include <stddef.h>

typedef unsigned char uint8_t;
typedef long int64_t;
typedef unsigned long uint64_t;

extern void* dlopen(const char* filename, int flags);
extern void* dlsym(void* handle, const char* symbol);

static void my_memcpy(void* dst, const void* src, size_t n) {
    uint8_t* d = (uint8_t*)dst;
    const uint8_t* s = (const uint8_t*)src;
    for (size_t i = 0; i < n; i++) d[i] = s[i];
}

static void my_memset(void* dst, int v, size_t n) {
    uint8_t* d = (uint8_t*)dst;
    for (size_t i = 0; i < n; i++) d[i] = (uint8_t)v;
}

bool SetTaskProfiles(int tid, const char* const profiles[], size_t num_profiles, bool use_fd_cache) {
    (void)tid; (void)profiles; (void)num_profiles; (void)use_fd_cache;
    return true;
}

static void* gui_handle(void) {
    static void* h = NULL;
    if (!h) h = dlopen("libgui.so", 1);
    return h;
}

typedef void (*bufitem_ctor_t)(void*);
typedef void (*bufitem_dtor_t)(void*);
typedef void (*create_bq_t)(void**, void**, bool);

static void* real_bqc_vt[36];
static void* shim_bqc_vt[36];
static int vt_init = 0;

static int shim_acquireBuffer(void* self, void* outItem, int64_t presentWhen, uint64_t maxFrame) {
    static bufitem_ctor_t ctor = NULL;
    static bufitem_dtor_t dtor = NULL;
    if (!ctor) {
        void* h = gui_handle();
        ctor = (bufitem_ctor_t)dlsym(h, "_ZN7android10BufferItemC1Ev");
        dtor = (bufitem_dtor_t)dlsym(h, "_ZN7android10BufferItemD1Ev");
    }
    uint8_t tmp[512];
    my_memset(tmp, 0, sizeof(tmp));
    if (ctor) ctor(tmp);
    typedef int (*acq_t)(void*, void*, int64_t, uint64_t);
    int rc = ((acq_t)real_bqc_vt[0x30 / 8])(self, tmp, presentWhen, maxFrame);
    my_memcpy(outItem, tmp, 0x118);
    *(uint64_t*)((uint8_t*)outItem + 0x98) = *(uint64_t*)(tmp + 0xa8);
    /* Android 17 moved mSlot; faced expects the legacy BufferItem offset. */
    *(int*)((uint8_t*)outItem + 0xa0) = *(int*)(tmp + 0xb4);
    my_memset(tmp, 0, 0x10);
    if (dtor) dtor(tmp);
    return rc;
}

static int shim_setMaxAcquiredBufferCount(void* self, int maxAcquired) {
    if (maxAcquired < 3) maxAcquired = 3;
    typedef int (*fn_t)(void*, int);
    return ((fn_t)real_bqc_vt[0x88 / 8])(self, maxAcquired);
}

static int shim_releaseBuffer(void* self, int slot, uint64_t frame, void* dpy, void* sync, void* fence) {
    (void)dpy; (void)sync;
    typedef int (*rel_t)(void*, int, uint64_t, void*);
    return ((rel_t)real_bqc_vt[0x48 / 8])(self, slot, frame, fence);
}

void _ZN7android10BufferItemC1Ev(void* item) {
    my_memset(item, 0, 0x118);
    *(int*)((uint8_t*)item + 0xa0) = -1;
}

void _ZN7android11BufferQueue17createBufferQueueEPNS_2spINS_22IGraphicBufferProducerEEEPNS1_INS_22IGraphicBufferConsumerEEEb(
    void** outProducer, void** outConsumer, bool consumerIsSurfaceFlinger) {
    static create_bq_t real_create = NULL;
    if (!real_create) {
        real_create = (create_bq_t)dlsym(gui_handle(),
            "_ZN7android11BufferQueue17createBufferQueueEPNS_2spINS_22IGraphicBufferProducerEEEPNS1_INS_22IGraphicBufferConsumerEEEb");
    }
    real_create(outProducer, outConsumer, consumerIsSurfaceFlinger);
    if (outConsumer && *outConsumer) {
        void** orig_vt = *(void***)(*outConsumer);
        if (!vt_init) {
            for (int i = 0; i < 36; i++) {
                real_bqc_vt[i] = orig_vt[i];
                shim_bqc_vt[i] = orig_vt[i];
            }
            shim_bqc_vt[0x20 / 8] = (void*)shim_acquireBuffer;
            shim_bqc_vt[0x38 / 8] = (void*)shim_releaseBuffer;
            shim_bqc_vt[0x40 / 8] = orig_vt[0xe8 / 8];
            shim_bqc_vt[0x48 / 8] = orig_vt[0xf0 / 8];
            shim_bqc_vt[0x50 / 8] = orig_vt[0x60 / 8];
            shim_bqc_vt[0x58 / 8] = orig_vt[0x70 / 8];
            shim_bqc_vt[0x60 / 8] = orig_vt[0x80 / 8];
            shim_bqc_vt[0x68 / 8] = (void*)shim_setMaxAcquiredBufferCount;
            shim_bqc_vt[0x70 / 8] = orig_vt[0x98 / 8];
            shim_bqc_vt[0x78 / 8] = orig_vt[0xa0 / 8];
            shim_bqc_vt[0x80 / 8] = orig_vt[0xa8 / 8];
            shim_bqc_vt[0x88 / 8] = orig_vt[0xb0 / 8];
            shim_bqc_vt[0x90 / 8] = orig_vt[0xc0 / 8];
            shim_bqc_vt[0x98 / 8] = orig_vt[0xc8 / 8];
            shim_bqc_vt[0xa0 / 8] = orig_vt[0xd0 / 8];
            shim_bqc_vt[0xa8 / 8] = orig_vt[0xd8 / 8];
            shim_bqc_vt[0xb0 / 8] = orig_vt[0xe0 / 8];
            vt_init = 1;
        }
        *(void***)(*outConsumer) = shim_bqc_vt;
    }
}

typedef void (*surface_ctor_t)(void*, const void*, bool, const void*, const void*);
void _ZN7android7SurfaceC1ERKNS_2spINS_22IGraphicBufferProducerEEEbRKNS1_INS_7IBinderEEE(
    void* self, const void* producer, bool controlledByApp, const void* parentHandle) {
    static surface_ctor_t ctor = NULL;
    if (!ctor) {
        ctor = (surface_ctor_t)dlsym(gui_handle(),
            "_ZN7android7SurfaceC1ERKNS_2spINS_22IGraphicBufferProducerEEEbRKNS1_INS_7IBinderEEENSt3__18optionalINS2_13SurfaceConfigEEE");
    }
    if (ctor) {
        /* nullopt SurfaceConfig */
        uint64_t nullopt_config[6] = {0};
        ctor(self, producer, controlledByApp, parentHandle, nullopt_config);
    }
}

typedef struct {
    const char* dli_fname;
    void* dli_fbase;
    const char* dli_sname;
    void* dli_saddr;
} MyDlInfo;
extern int dladdr(const void* addr, MyDlInfo* info);
extern int mprotect(void* addr, size_t len, int prot);

static void shim_proxy_getBLASTBufferQueue(void) __attribute__((naked));
static void shim_proxy_getBLASTBufferQueue(void) {
    __asm__ volatile("str xzr, [x8]\n\tret");
}

static void patch_proxy_listener_vtable(void) {
    void* h = gui_handle();
    void** vtable = (void**)dlsym(h, "_ZTVN7android11BufferQueue21ProxyConsumerListenerE");
    void* method = dlsym(h, "_ZNK7android11BufferQueue21ProxyConsumerListener19getBLASTBufferQueueEv");
    if (!vtable || !method) return;

    for (size_t i = 2; i < 30; i++) {
        if (vtable[i] != method) continue;
        unsigned long page = (unsigned long)&vtable[i] & ~0xfffUL;
        if (mprotect((void*)page, 0x1000, 3) != 0) return;
        vtable[i] = (void*)shim_proxy_getBLASTBufferQueue;
        mprotect((void*)page, 0x1000, 1);
    }
}

typedef int (*set_preview_t)(void*, void*, int, int);
static set_preview_t real_set_preview = NULL;

static int shim_setPreviewTarget(void* self, void* bp, int w, int h) {
    if (self) {
        int cam = *(int*)((uint8_t*)self + 0x68);
        if (cam < 0 || cam > 1) {
            *(int*)((uint8_t*)self + 0x68) = 0;
        }
    }
    return real_set_preview ? real_set_preview(self, bp, w, h) : -888;
}

__attribute__((constructor)) static void init_shim(void) {
    patch_proxy_listener_vtable();
    void* fh = dlopen("libFaceService.so", 4);
    if (!fh) fh = dlopen("libFaceService.so", 1);
    void* sym = fh ? dlsym(fh, "ss_face_setPreviewTarget") : dlsym((void*)0, "ss_face_setPreviewTarget");
    if (!sym) return;
    MyDlInfo info;
    my_memset(&info, 0, sizeof(info));
    if (!dladdr(sym, &info) || !info.dli_fbase) return;
    uint8_t* base = (uint8_t*)info.dli_fbase;
    real_set_preview = (set_preview_t)(base + 0x182c0);
    void** got_slot = (void**)(base + 0x2cff8);
    unsigned long page = (unsigned long)got_slot & ~0xfffUL;
    if (mprotect((void*)page, 0x1000, 3) == 0) {
        *got_slot = (void*)shim_setPreviewTarget;
    }
}
