.class Lcom/android/settings/OneROMHelper$11;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper;->buildUnicaScreen(Landroidx/preference/PreferenceFragmentCompat;)V
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

    .line 352
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$11;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 355
    iget-object v0, p0, Lcom/android/settings/OneROMHelper$11;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/settings/OneROMHelper;->showChangelog(Landroid/content/Context;)V

    .line 356
    return-void
.end method
