.class Lcom/android/settings/OneROMHelper$7;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper;->buildSoftwareInfoScreen(Landroidx/preference/PreferenceFragmentCompat;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 275
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$7;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .registers 5

    .line 278
    iget-object p1, p0, Lcom/android/settings/OneROMHelper$7;->val$context:Landroid/content/Context;

    const-string v0, "io.github.tiann.kernelsu"

    const-string v1, "KernelSU Next v1.0.5 is active in kernel (Kprobes mode)"

    const-string v2, "com.rifsxd.ksunext"

    invoke-static {p1, v2, v0, v1}, Lcom/android/settings/OneROMHelper;->-$$Nest$smlaunchAppOrToast(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    const/4 p1, 0x1

    return p1
.end method
