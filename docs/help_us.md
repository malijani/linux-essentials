
# مشارکت در نوشتن کتاب

به دو روش زیر می‌تونید در توسعه این کتاب همکاری کنید:

### [حمایت مالی](https://idpay.ir/lin4e-donation)

#### حمایت عملی

* توی [github.com](https://github.com) یه حساب کاربری بسازید.

* وارد آدرس [github.com/malijani/linux-essentials](https://github.com/malijani/linux-essentials) بشید و روی دکمه Fork بفشارید :‌
![گرفتن یک شاخه از مخزن](./images/preface/fork_add.png)

*  ابزار git و python3 و pip و virtualenv رو نصب کنید(برای پلتفورم های مختلف این ابزار ها ارائه داده شدند. متناسب با سیستم عامل خودتون عمل نصب رو انجام بدید!)
    1. نصب ابزار git : ابزار رو از [اینجا](https://git-scm.com/downloads)دانلود و نصب کنید.
    2. نصب python : آخرین نسخه رو از [اینجا](https://www.python.org/downloads/) دانلود و نصب کنید(هنگام نصب گزینه فعال سازی pip رو هم بزنید)
    3. نصب virtualenv : کافیه دستور زیر رو برای نصب virtualenv بزنید :

<div dir="ltr"><code>pip install virtualenv</code></div>

* دستور زیر رو اجرا کنید(به جای YOUR_USERNAME نام کاربری گیتهاب خودتون رو بذارید):

<div dir="ltr"><code>git clone https://github.com/YOUR_USERNAME/linux-essentials</code></div>

* به linux-essentials تغییر مسیر بدید و  محیط مجازی توسعه پایتون رو بسازید([راهنمای virtualenv](https://virtualenv.pypa.io/en/latest/userguide/)) :

<div dir="ltr"><code>cd linux-essentials</code></div>

<div dir="ltr"><code>virtualenv -p python3 .venv</code></div>

* محیط مجازی رو فعال کنید :

<div dir="ltr">
    <span>Windows Git Bash:<code>source .venv/Scripts/activate</code></span><br/>
    <span>Linux:<code>source ./.venv/bin/activate</code></span>
</div>

* ابزار های مورد نیاز پروژه رو در حالی که محیط مجازی پایتون فعال هست رو به کمک pip نصب کنید:

<div dir="ltr"><code>pip install -r requirements.txt</code></div>

* حالا که محیط توسعه آمادست؛ کافیه نمونه تم رو که توی مخزن قرار دادم با نام mkdocs-theme-material.yml رو به مسیر زیر انتقال بدید:

<div dir="ltr">
    <span>Windows Git Bash:<code>cp mkdocs-theme-material.yml .venv/Lib/site-packages/material/mkdocs_theme.yml</code>
</span><br/><br/>
    <span>Linux:<code>cp mkdocs-theme-material.yml .venv/lib/python3.<b>X</b>/site-packages/material/mkdocs_theme.yml</code></span>
</div>

> به جای X در سیستم عامل لینوکس، نسخه پایتون مورد استفاده خودتون رو قرار بدید که با زدن کلید TAB مشخص میشه...


* سرور داخلی mkdocs رو برای توسعه و ویرایش راه اندازی کنید :

<div dir="ltr"><code>mkdocs serve</code></div>

* حالا کافیه محتویات درون مسیر docs رو با markdown ویرایش کنید و تغییرات رو به صورت زنده در مسیر localhost:8000 مشاهده کنید.

* پس از انجام تغییرات دلخواهتون کافیه به کمک git اونا رو ذخیره کنید و به مخزن روی سرور گیتهابتون که از مخزن اصلی فرستاده شده بفرستید:

<div dir="ltr"><code>git add .</code></div>
<div dir="ltr"><code>git commit -m "Changed FILE Fixed ISSUE"</code></div>
<div dir="ltr"><code>git push</code></div>

* وارد حساب کاربری گیتهاب و مخزن فورک شده linux-essentials بشید ؛ حالا روی دکمه New pull request بزنید ، موضوع تغییرات رو تعیین کنید و برای اون ها توضیحاتی بیارید و دکمه Create pull request رو بزنید تا ایجاد بشه:
![ایجاد pull request](./images/preface/pull_request.png)
(مثالی برای انتخاب موضوع و توضیحات):
![ساخت pull request](./images/preface/create_pull_request.png)

<div dir="ltr"><b>You can change me if you're testing this instruction!</b></div>
