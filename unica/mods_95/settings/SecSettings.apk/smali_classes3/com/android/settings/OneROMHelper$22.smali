.class Lcom/android/settings/OneROMHelper$22;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper;->buildUIScreen(Landroidx/preference/PreferenceFragmentCompat;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$animTypes:[Ljava/lang/String;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;[Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 513
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$22;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/settings/OneROMHelper$22;->val$animTypes:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .registers 6

    .line 516
    iget-object v0, p0, Lcom/android/settings/OneROMHelper$22;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/settings/OneROMHelper$22;->val$animTypes:[Ljava/lang/String;

    new-instance v2, Lcom/android/settings/OneROMHelper$22$1;

    iget-object v3, p0, Lcom/android/settings/OneROMHelper$22;->val$context:Landroid/content/Context;

    invoke-direct {v2, p0, v3, p1}, Lcom/android/settings/OneROMHelper$22$1;-><init>(Lcom/android/settings/OneROMHelper$22;Landroid/content/Context;Landroidx/preference/Preference;)V

    const-string p1, "Launcher Animation Type"

    invoke-static {v0, p1, v1, v2}, Lcom/android/settings/OneROMHelper;->-$$Nest$smshowChoiceDialog(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Lcom/android/settings/OneROMHelper$DialogCallback;)V

    .line 523
    const/4 p1, 0x1

    return p1
.end method
