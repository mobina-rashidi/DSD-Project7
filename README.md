
![Project Logo](logo.png)

## سوال ۷
<p align="justify">
در این بخش به حل سوال ۷ پرداخته شده است . پروژه ی مدنظر ساخت یک پردازنده آرایه ای 512 بیتی می باشد که دارای 3 بخش است : یک رجیستر فایل با قابلیت ذخیره سازی 4 آرایه 512 بیتی ، یک واحد ریاضی با قابلیت ضرب و جمع ، یک حافظه با عمق 512 و عرض 32 بیت است . مجموعه دستورات این پردازنده شامل بارگزاری از حافظه در یکی از ثبات ها ، ذخیره سازی از یکی ثبات ها به حافظه ، جمع واحد ریاضی و ضرب واحد ریاضی می باشد که در ادامه به بررسی دقیق تر آن پرداخته شده است . 
</p>

## ابزار های استفاده شده در پروژه
<p align="justify">- ModelSim</p>

## جزئیات پیاده سازی
**ماژول RegisterFile**
![Project Logo](photos/registerFile.png)

<p align="justify">
همانگونه که درتصویر بالا مشاهده می‌کنید ماژول ۶ ورودی دارد که ۲ ورودی برای انتخاب آدرس‌های خوانده‌شونده ، یک ورودی برای کلاک ، یک ورودی برای write enable و یک ورودی برای دریافت دیتایی که می‌خواهیم در آدرس مدنظر بنویسیم . همانگونه که در خط 12 مشاهده می‌شود 4 عدد آرایه 512 بیتی خواسته ی سوال را تعریف کرده ایم . حال به بررسی بلاک always میپردازیم که بخش ابتدایی آن به نوشتن در رجیسترفایل پرداخته شده‌‌ است (در صورتی که write_en ، یک باشد یعنی قصد نوشتن را داریم که بعد از آن وارد بلاک switch case می‌شود که بسته به آدرس داده‌شده ، دیتا را دررجیستر مربوطه ذخیره می‌کند .) . در بخش بعد به خواندن از رجیستر فایل پرداخته‌شده‌است (دو ورودی rd_data1 و rd_data2 بررسی می‌شوند که این دو ورودی همانگونه که ذکر‌شد دارای آدرس‌هایی هستند که میخواهیم از رجیستر فایل بخوانیم و بسته به این آدرس‌های رجیسترها دیتاهای مدنظر وارد خروجی می‌شوند.) .
</p>

**ماژول MathUnit**
![Project Logo](photos/mathUnit.png)
<p align="justify">
همانگونه که در تصویر بالا مشاهده می‌کنید ماژول ۴ ورودی دارد که ۲ ورودی اول برای محاسبات هستند و یک ورودی add برای تشخیص جمع کردن و یک ورودی mul برای تشخیص ضرب دارد . در بلاک always اگر add ، یک باشد عمل جمع را انجام داده و در low می ریزد و high را صفر می کند و اگر mul ، یک باشد عمل ضرب را انجام داده و باتوجه به سینتکس استفاده شده 512 بیت کم ارزش را در low و 512 بیت پرارزش را در high ریخته و خروجی می دهد و در غیر این صورت اگر هیچکدام از حالت های گفته شده نبود خروجی های ماژول را صفر می کند . 
</p>

**ماژول Memory**
![Project Logo](photos/Memory.png)
<p align="justify">
همانگونه که در تصویر بالا مشاهده می کنید ماژول ۴ ورودی دارد که یک ورودی کلاک ، یک ورودی write enable ، یک ورودی آدرس و یک ورودی دیتا می باشد . در خط 8 Memory با عمق 512 و عرض 32 بیت مطابق خواسته ی سوال تعریف شده است . در بلاک always همانگونه که مشاهده می شود اگر write_enable ، یک باشد یعنی عمل نوشتن در حافظه صورت بگیرد ( دیتایی که به عنوان ورودی به ماژول دادیم را در آدرس خواسته شده در حافظه ذخیره می کند ) و در غیر این صورت اگر write_enable صفر باشد ، آدرس داده شده از حافظه را خوانده و وارد خروجی می کند . 
</p>

**ماژول processor**
![Project Logo](photos/perocessor1.png)
![Project Logo](photos/processor2.png)
<p align="justify">
همانگونه که در تصویر مشاهده میکنید در این ماژول از سه ماژول دیگر که تعریف شده است instance گرفته و پورت های مربوطه را وصل کرده ایم . نکته ی قابل ذکر این است که برای دستورات بارگزاری از حافظه در یکی از ثبات ها و ذخیره سازی از یکی از ثبات ها به حافظه به عبارتی دستورات load و store از دو TriState-Buffer استفاده کرده تا دستورات به درستی اجرا شوند . 
</p>

## نویسنده
مبینا رشیدی 401170564
