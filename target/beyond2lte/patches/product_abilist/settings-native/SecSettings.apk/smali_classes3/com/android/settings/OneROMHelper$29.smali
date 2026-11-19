.class Lcom/android/settings/OneROMHelper$29;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper;->setupBixbyPref(Landroidx/preference/PreferenceCategory;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$actions:[Ljava/lang/String;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;[Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 636
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$29;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/settings/OneROMHelper$29;->val$actions:[Ljava/lang/String;

    iput-object p3, p0, Lcom/android/settings/OneROMHelper$29;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .registers 8

    .line 639
    iget-object v0, p0, Lcom/android/settings/OneROMHelper$29;->val$context:Landroid/content/Context;

    invoke-virtual {p1}, Landroidx/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/settings/OneROMHelper$29;->val$actions:[Ljava/lang/String;

    new-instance v3, Lcom/android/settings/OneROMHelper$29$1;

    iget-object v4, p0, Lcom/android/settings/OneROMHelper$29;->val$context:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/settings/OneROMHelper$29;->val$key:Ljava/lang/String;

    invoke-direct {v3, p0, v4, v5, p1}, Lcom/android/settings/OneROMHelper$29$1;-><init>(Lcom/android/settings/OneROMHelper$29;Landroid/content/Context;Ljava/lang/String;Landroidx/preference/Preference;)V

    invoke-static {v0, v1, v2, v3}, Lcom/android/settings/OneROMHelper;->-$$Nest$smshowChoiceDialog(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Lcom/android/settings/OneROMHelper$DialogCallback;)V

    .line 646
    const/4 p1, 0x1

    return p1
.end method
