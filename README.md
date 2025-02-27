# Money Mate
Money Mate adalah sebuah aplikasi yang digunakan untuk melakukan pencatatan pengeluaran sehari hari guna mengetahui statistik dari pengeluaran, apa saja yang perlu di improve dari pembelian hari ke hari. 

## Fitur
- User dapat melakukan Sign-In dan Sign-Up
- User dapat melakukan pendataan barang barang yang dibelinya
- User dapat melihat statistik per kategori barangnya
- User dapat melihat total pengeluaran yang telah dihabiskan
- User dapat melakukan Konversi mata uang dari RUPIAH KE (USD,EUR,JPY)

## Checklist beberapa penilaian Motion-Lab ##

- ✅ Menggunakan **Splash Screen** dengan depedency flutter_native_splash
- ✅ Menggunakan **Autentikasi** dengan Firebase Auth untuk melakukan Sign-In dan Sign-Up
- ✅ Menggunakan **Local Storage** dengan Hive DB guna menyimpan informasi Login user(Sehingga perangkat bisa menahan user agar tidak harus signin terus menerus)
- ✅ Menggunakan **API Exchange Rate**, yaitu sebuah API yang mengakomodir seluruh konversi Currency dengan realtime data base yang diatur oleh pemilih database tersebut. INFO : _https://www.exchangerate-api.com/_
- ✅ Mengimplementasikan sistem **CRUD(Create, Read, Update, Delete)** berikut rinciannya :

  _CREATE_ : Menambahkan keperluan dan pengeluaran
  _READ_ : Menampilkan menggunakan streambuilder di HomeView dan DetailView
  _UPDATE_ : Melakukan Update data nama(firestore) di ProfileView
  _DELETE_ : Melakukan Delete data user di ProfileView

- ✅ Mengimplemetasikan **GETX dan GETCLI** Saat pembuatan project menggunakan "get create project"
- ✅ Melakukan Dokjumentasi dan Struktur Folder sesuai dengan GETCLI yang telah dipelajari.


  ## DOKUMENTASI
  
![Money Mate](https://github.com/user-attachments/assets/72e3437e-1ede-4317-9dc4-5fc581fea83c)
