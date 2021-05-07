//
//  MenuUtamaViewController.swift
//  Seedu Halaman awal
//
//  Created Kevin Leon on 08/04/21.
//

import UIKit
import CoreData
class MenuUtamaViewController: UIViewController {

    @IBOutlet weak var reproduksiButton: UIButton!
    @IBOutlet weak var citraTubuhButton: UIButton!
    @IBOutlet weak var pubertasButton: UIButton!
    @IBOutlet weak var anatomiButton: UIButton!
    @IBOutlet weak var tipsButton: UIButton!
    let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var selectedTopic: Int = 0
    override func viewDidLoad() {
           super.viewDidLoad()
//        addData()

            if UserDefaults.standard.bool(forKey: "onBoarding") == nil {
            UserDefaults.standard.setValue(true, forKey: "onBoarding")
            print(UserDefaults.standard.bool(forKey: "onBoarding"))
            
        }
        if UserDefaults.standard.bool(forKey: "onBoarding"){
            
            let Storyboard = UIStoryboard(name: "Main", bundle: nil)
            let DestVC = Storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.isNavigationBarHidden = true
                self.navigationController?.pushViewController(DestVC, animated: true)
        }else{
            
        }
        
        reproduksiButton.layer.cornerRadius = 7
        citraTubuhButton.layer.cornerRadius = 7
        pubertasButton.layer.cornerRadius = 7
        anatomiButton.layer.cornerRadius = 7
        tipsButton.layer.cornerRadius = 7
        
        
    }
//    func deleteData(){
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
//        let managedContex = appDelegate.presistentContainer.viewContnext
//
//    }

    @IBAction func topik1Button(_ sender: Any) {
        selectedTopic = 0
        goToQuiz()
    }
    @IBAction func topik2Button(_ sender: Any) {
        selectedTopic = 1
       goToQuiz()
    }
    
    @IBAction func topik3Button(_ sender: Any) {
        selectedTopic = 2
        goToQuiz()
    }
    @IBAction func topik4Button(_ sender: Any) {
        selectedTopic = 3
        goToQuiz()
    }
    func goToQuiz() -> () {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DestVC = Storyboard.instantiateViewController(withIdentifier: "QuizIntroViewController") as! QuizIntroViewController
        DestVC.topicId = selectedTopic

        self.navigationController?.pushViewController(DestVC, animated: true)
    }
    
    func addData() -> () {
        

        //Tambah semuanya ke core data
        var counter = 0
        for pertanyaans in pertanyaan{
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let tempData = Bookmark(context:self.context)
            var tempbookmarkid = NSNumber(value: counter)
            var temptitle = pertanyaans.question
            var temppenjelasan = pertanyaans.penjelasan[pertanyaans.correctAns]
            var tempjawaban = pertanyaans.options[pertanyaans.correctAns]
            var temptips = pertanyaans.tips
            var tempimage = pertanyaans.image
            
            var tempbookmarked = 0
            tempData.setValue(temptitle, forKey: "title")
            tempData.setValue(temppenjelasan, forKey: "penjelasan")
            tempData.setValue(tempjawaban, forKey: "jawaban")
            tempData.setValue(tempbookmarkid, forKey: "bookmarkid")
            tempData.setValue(temptips, forKey: "tips")
            tempData.setValue(tempimage, forKey: "image")
            tempData.setValue(tempbookmarked, forKey: "bookmarked")
            counter = counter + 1
            do {
                try context.save()
                print("Data Saved Successfully")
            } catch {
                print("Data Saved Unsucesfully")
            }
        }
        

       
    }
    
    
    
    
}
public struct Quiz {
    var question_ID : Int
    var topic_ID: Int
    var question : String
    var image : String
    var options: [String]
    var bookmark : Bool
    var penjelasan : [String]
    var tips : String
    var correctAns : Int
}
public var pertanyaan = [
    Quiz(
        question_ID: 1,
        topic_ID: 0,
        question: "Bagaimana bayi terbentuk?",
        image: "Reproduksi - Q1",
        options : ["Bertemunya sperma dan sel telur","Dari rahim ibu", "Surga"],
        bookmark : false,
        penjelasan: ["Bayi terbentuk dari sel telur dan sperma yang bersatu.\n\nLaki-laki memiliki sel kecil di dalam tubuh bernama sperma. Sel sperma ukurannya sangat kecil dan terlihat seperti kecebong apabila dilihat di bawah mikroskop.Perempuan memiliki sel telur di dalam tubuh mereka.\n\nSama seperti sperma, sel telur juga berukuran sangat kecil dan ada pada  sel telur perempuan bertemu sperma laki-laki, keduanya bersatu sehingga terjadi kehamilan.","Bayi bertumbuh di rahim ibu, tetapi bayi berasal dari sel telur & sperma yang bersatu.\n\nLaki-laki memiliki sel kecil di dalam tubuh bernama sperma. Sel sperma ukurannya sangat kecil dan terlihat seperti kecebong apabila dilihat di bawah mikroskop. Perempuan memiliki sel telur di dalam tubuh mereka. Jelaskan juga bahwa sel telur berbeda dengan telur hewan.\n\nSama seperti sperma, sel telur juga berukuran sangat kecil. Saat sel telur perempuan bertemu sperma laki-laki, keduanya bersatu sehingga terjadi kehamilan.","Secara ilmiah,bayi berasal dari sel telur & sperma yang bersatu.\n\nLaki-laki memiliki sel kecil di dalam tubuh bernama sperma. Sel sperma ukurannya sangat kecil dan terlihat seperti kecebong apabila dilihat di bawah mikroskop. Perempuan memiliki sel telur di dalam tubuh mereka. Jelaskan juga bahwa sel telur berbeda dengan telur hewan.\n\nSama seperti sperma, sel telur juga berukuran sangat kecil. Saat sel telur perempuan bertemu sperma laki-laki, keduanya bersatu sehingga terjadi kehamilan."],
        tips: "Sebelum mulai menjelaskan kepada anak, Anda bisa bertanya terlebih dahulu mengenai apa saja yang anak Anda ketahui mengenai asalnya bayi.\n\nApabila anak bertanya lebih lanjut, Anda bisa menjelaskan bahwa sel sperma dan sel telur bersatu saat ayah & ibu melakukan menunjukkan kasih sayang dengan melakukan hubungan seks. Saat berhubungan, sel sperma akan berenang untuk bertemu sel telur.\n\nSaat menjelaskan mengenai hubungan seks, tegaskan bahwa hubungan seks hanya dilakukan oleh orang dewasa secara privat. Pada bagian ini, Anda bisa memasukkan nilai-nilai yang Anda pegang seperti nilai agama, budaya, dan lain-lain.",
        correctAns : 0),
    
    Quiz(
        question_ID: 2,
        topic_ID: 0,
        question: "Di mana bayi bertumbuh?",
        image: "Reproduksi - Q2",
        options : ["Perut","Rahim","Vagina"],
        bookmark: false,
        penjelasan: ["Bayi tidak bertumbuh di perut melainkan di rahim.\n\nSaat sel sperma & sel telur bersatu, akan terbentuk zigot. Zigot akan bertumbuh di rahim atau uterus selama kurang lebih 9 bulan.","Bayi bertumbuh di rahim ibu.\n\nSaat sel sperma & sel telur bersatu, akan terbentuk zigot. Zigot akan bertumbuh di rahim atau uterus selama kurang lebih 9 bulan.","Bayi tidak bertumbuh di vagina melainkan di rahim.\n\nSaat sel sperma & sel telur bersatu, akan terbentuk zigot. Zigot akan bertumbuh di rahim atau uterus selama kurang lebih 9 bulan."],
            
        tips :"Tegaskan bahwa rahim berbeda dengan perut. Perut merupakan tempat dimana kita menyimpan makanan sementara rahim merupakan tempat dimana bayi bertumbuh.",
            correctAns : 1)
    ,
    Quiz(
        question_ID: 1,
        topic_ID: 1,
        question: "Apa yang sebaiknya pertama kali dilakukan ketika anak membandingkan penampilan fisik mereka dengan orang lain?",
        image: "Citra Tubuh - Q1",
        options: ["Jelaskan bahwa mereka punya kelebihan dibanding orang tersebut", "Tanyakan alasan mereka mengapa berpikir begitu ", "c Mengatakan bahwa tidak ada orang yang sempurna"],
        bookmark : false,
        penjelasan: ["Sebaiknya hindari membuat perbandingan sebagai penjelasan untuk menghibur anak, karena dapat membangun pemikiran yang menjadi lebih menghakimi dan suka membandingkan diri dengan orang lain. \n\n Sebaiknya pertama-tama, cari tahu dulu alasan mengapa anak berkata demikian. Ini akan memulai percakapan dan memberi Anda kesempatan untuk membicarakan apa yang membuat dia spesial.\n\nBaru kemudian, jelaskan bahwa tidak ada manusia yang sempurna, tetapi terkadang yang membuat adanya perbedaan adalah cara diri kita merawat tubuh kita dan kebugaran tubuh. Dari sana Anda bisa juga mengajak anak untuk merawat diri dan mendorong mereka untuk hidup lebih sehat.\n\nApabila anak bertanya karena ia membandingkan diri dengan apa yang ia lihat di televisi atau majalah, Anda juga bisa menjelaskan bagaimana tubuh yang sehat terkadang terlihat berbeda dari yang kita lihat di TV dan majalah.",
                     
                     "Sebaiknya pertama-tama, cari tahu dulu alasan mengapa anak berkata demikian. Ini akan memulai percakapan dan memberi Anda kesempatan untuk membicarakan apa yang membuat dia spesial.\n\n Baru kemudian, jelaskan bahwa tidak ada manusia yang sempurna, tetapi terkadang yang membuat adanya perbedaan adalah cara diri kita merawat tubuh kita dan kebugaran tubuh. Dari sana Anda bisa juga mengajak anak untuk merawat diri dan mendorong mereka untuk hidup lebih sehat. \n\n Apabila anak bertanya karena ia membandingkan diri dengan apa yang ia lihat di televisi atau majalah, Anda juga bisa menjelaskan bagaimana tubuh yang sehat terkadang terlihat berbeda dari yang kita lihat di TV dan majalah.",
                     
                     "Walaupun pernyataan ini benar dan bisa Anda gunakan, pertama-tama Anda bisa bertanya dulu mengenai alasan mengapa mereka berkata demikian. Ini akan memulai percakapan dan memberi Anda kesempatan untuk membicarakan apa yang membuat dia spesial.\n\n Baru kemudian, jelaskan bahwa tidak ada manusia yang sempurna, tetapi terkadang yang membuat adanya perbedaan adalah cara diri kita merawat tubuh kita dan kebugaran tubuh. Dari sana Anda bisa juga mengajak anak untuk merawat diri dan mendorong mereka untuk hidup lebih sehat.\n\nApabila anak bertanya karena ia membandingkan diri dengan apa yang ia lihat di televisi atau majalah, Anda juga bisa menjelaskan bagaimana tubuh yang sehat terkadang terlihat berbeda dari yang kita lihat di TV dan majalah."],
        tips : "Hindari membuat komentar-komentar negatif mengenai tubuh anak, diri Anda, ataupun orang lain, termasuk memberikan nama panggilan yang merujuk pada bentuk tubuh, tampilan fisik, dan sebagainya. \n\nSelain itu, sebaiknya juga hindari membuat perbandingan antara kelebihan anak dengan kekurangan orang lain untuk menghibur mereka karena ini dapat membangun pemikiran anak menjadi lebih menghakimi dan suka membandingkan diri dengan orang lain.\n\n Alih-alih membandingkan, Anda bisa menanyakan pendapat anak, misalnya, Apakah bentuk tubuh ada hubungannya dengan karakter seseorang?.",
        correctAns: 1
    ),
    
    Quiz(
        question_ID: 2,
        topic_ID: 1,
        question: "Apa yang sebaiknya dilakukan ketika anak tidak ingin makan karena merasa gemuk?",
        image: "Citra Tubuh - Q2",
        options: ["Memarahi anak karena tidak mensyukuri makanan", "Jelaskan bahwa tidak baik untuk membuang makanan", "Jelaskan ke anak bahwa makanan ada yang sehat dan tidak sehat"],
        bookmark : false,
        penjelasan: ["Sebaiknya hindari menanggapi pertanyaan atau pernyataan anak dengan kemarahan karena akan membuat anak merasa tidak suka atau bahkan nantinya sungkan untuk bertanya lagi.\n\nSebaiknya terapkan konsep bahwa makanan itu ada yang baik dan buruk, sehat dan tidak sehat. Dengan begitu anak akan sadar bahwa makanan itu bukan penyebab utama sehingga mereka tidak  menghindari makanan sepenuhnya.",
                     "Menjelaskan dengan cara demikian kemungkinan tidak membuat anak merasa puas dan kurang efektif untuk menyelesaikan masalah yang dihadapi anak. Selain itu, cara ini juga tidak mengedukasi anak mengenai konsep pola makan yang benar dan sehat.\n\nSebaiknya terapkan konsep bahwa makanan itu ada yang baik dan buruk, sehat dan tidak sehat. Dengan begitu anak akan sadar bahwa makanan itu bukan penyebab utama sehingga mereka tidak  menghindari makanan sepenuhnya.",
                     "Terapkan konsep bahwa makanan itu ada yang baik dan buruk, sehat dan tidak sehat. Dengan begitu anak akan sadar bahwa makanan itu bukan penyebab utama sehingga mereka tidak  menghindari makanan sepenuhnya."],
        tips : "Anda bisa mengedukasi anak mengenai makanan yang boleh untuk selalu  dimakan sehari-hari seperti sayuran, buah, dan makanan pokok yang penting untuk pertumbuhan dan perkembangan mereka.\n\nKemudian jelaskan makanan yang terkadang boleh dimakan seperti gorengan dan manisan karena rasanya yang enak tetapi kurang memiliki pengaruh yang baik bagi tubuh. Jadi anak juga belajar mengenai alasan mengapa harus menyesuaikan porsi makanan yang terkadang boleh dimakan tersebut.Hindari juga menggunakan bahasa dengan konotasi negatif seperti gendut agar tidak terjadi body-shaming.",
        correctAns: 2
    )
,
    Quiz(
        question_ID: 1,
        topic_ID: 2,
        question: "Apa perubahan yang dialami oleh laki-laki di masa pubertas?",
        image: "Pubertas - Q1",
        options: ["Testis membesar", "Payudara membesar", "Emosi lebih intens dan kompleks"],
        bookmark : false,
        penjelasan: ["Perubahan fisik pubertas pada anak laki-laki biasanya dimulai dengan pembesaran testis. Selain itu, bentuk tubuhnya akan mulai berubah ketika bahunya melebar dan dia menambah berat badan dan otot.\n\nSementara tumbuhnya emosi yang lebih intens & kompleks, tumbuhnya rambut kemaluan, dan percepatan pertumbuhan merupakan perubahan fisik yang dialami laki-laki maupun perempuan di masa pubertas.",
                     "Payudara membesar merupakan tanda pubertas pada perempuan. Perubahan fisik pubertas pada anak laki-laki biasanya dimulai dengan pembesaran testis. Selain itu, bentuk tubuhnya akan mulai berubah ketika bahunya melebar dan dia menambah berat badan dan otot. \n\nSementara tumbuhnya emosi yang lebih intens & kompleks, tumbuhnya rambut kemaluan, dan percepatan pertumbuhan merupakan perubahan fisik yang dialami laki-laki maupun perempuan di masa pubertas.",
                     "Perubahan emosi yang menjadi lebih intens & kompleks dialami oleh laki-laki DAN Perempuan. Hal ini diakibatkan oleh perubahan hormon yang dapat membuat seorang anak yang memasuki masa remaja merasa emosinya tidak terkendali karena mereka mungkin belum memiliki kapasitas mental untuk mengatasinya, menyebabkan lebih mudah tersinggung dan frustrasi."],
        tips : "Jelaskanlah pertumbuhan rambut kemaluan dan pembesaran testis adalah hal yang sangat normal untuk dialami seorang laki-laki di masa pubertas nantinya.",
        correctAns: 0),

      Quiz(
          question_ID: 2,
        topic_ID: 2,
          question: "Manakah pernyataan yang tidak tepat mengenai pubertas?",
          image: "Pubertas - Q2",
          options: ["Pubertas merupakan tahap perkembangan menuju dewasa", "Pubertas meliputi perubahan fisik dan emosional", "Pubertas hanya terjadi pada perempuan saja"],
          bookmark : false,
          penjelasan: ["Pubertas merupakan masa perkembangan dari anak-anak menuju dewasa dan terjadi pada laki-laki & perempuan. \n\nPubertas biasanya terjadi pada rentang usia 10-14 tahun pada perempuan dan 12-16 tahun pada laki-laki. Saat pubertas, remaja akan mengalami perubahan fisik dan emosional karena adanya perubahan hormon.",
                       "Pubertas merupakan masa perkembangan dari anak-anak menuju dewasa dan meliputi perubahan fisik dan emosional.\n\n Pubertas biasanya terjadi pada rentang usia 10-14 tahun pada perempuan dan 12-16 tahun pada laki-laki. Saat pubertas, remaja akan mengalami perubahan fisik dan emosional karena adanya perubahan hormon.",
                       "Pubertas terjadi pada laki-laki dan perempuan.\n\n Pubertas merupakan masa perkembangan dari anak-anak menuju dewasa. Pubertas biasanya terjadi pada rentang usia 10-14 tahun pada perempuan dan 12-16 tahun pada laki-laki. Saat pubertas, remaja akan mengalami perubahan fisik dan emosional karena adanya perubahan hormon."],
          tips : "Jelaskan bahwa pubertas hal yang wajar dan dialami oleh setiap orang. Gunakan situasi sehari-hari untuk memicu diskusi dan percakapan dengan anak.",
          correctAns: 2
      )
,
    
    


    Quiz(
        question_ID: 1,
        topic_ID: 3,
        question: "Pada perempuan, saluran tempat mengeluarkan urin disebut ...",
        image: "Anatomi - Q1",
        options: ["Vagina","Vulva","Uretra"],
        bookmark: false,
        penjelasan: [
        "Vagina merupakan alat kelamin perempuan yang salah satu fungsinya sebagai tempat keluar janin. Sementara saluran untuk mengeluarkan urin dinamakan uretra.\n\nUretra merupakan saluran khusus yang menghubungkan kandung kemih keluar tubuh. Uretra berbentuk lubang kecil yang berada diatas lubang vagina. Pada wanita uretra hanya berperan sebagai saluran pembuangan urine, tetapi pada pria memiliki fungsi lain untuk mengeluarkan air mani atau sperma.",
        "Vulva merupakan dinding terluar dari alat kelamin wanita. Vulva berfungsi untuk melindungi organ-organ bagian dalam. Sementara saluran untuk mengeluarkan urin dinamakan uretra.\n\nUretra merupakan saluran khusus yang menghubungkan kandung kemih keluar tubuh. Uretra berbentuk lubang kecil yang berada diatas lubang vagina. Pada wanita uretra hanya berperan sebagai saluran pembuangan urine, tetapi pada pria memiliki fungsi lain untuk mengeluarkan air mani atau sperma.",
            "Uretra merupakan saluran khusus yang terletak di atas lubang vagina.\n\nUretra merupakan saluran khusus yang menghubungkan kandung kemih keluar tubuh. Uretra berbentuk lubang kecil yang berada di atas lubang vagina. Pada wanita uretra hanya berperan sebagai saluran pembuangan urine, tetapi pada pria memiliki fungsi lain untuk mengeluarkan air mani atau sperma."],
        tips: "Terkadang anak hanya mengetahui nama dari alat kelaminnya tetapi tidak mengetahui kegunaan dan nama-nama organ lainnya di dalam alat kelamin mereka.\n\nAnda bisa menjelaskan secara perlahan menggunakan ilustrasi untuk memudahkan anak mengerti fungsi-fungsi organ dalam alat reproduksinya dengan sederhana.",
        correctAns: 2
    ),
    
    Quiz(
        question_ID: 2,
        topic_ID: 3,
        question: "Apa yang seharusnya dilakukan jika anak menanyakan mengenai alat reproduksi?",
        image: "Anatomi - Q2",
        options: ["Menjawab seadanya","Menjawab semua pertanyaan","Menanyakan darimana mengetahui"],
        bookmark: false,
        penjelasan:
        ["Dengan demikian anak akan lebih penasaran dan mencoba mencari tahu sendiri lebih lanjut tanpa filter dan pengawasan dari orang tua.\n\nWajar bahwa anak cenderung ingin tahu mengenai hal-hal tersebut sehingga lebih baik jika dijelaskan dengan pengawasan orang tua. Jelaskan juga mengenai hal-hal yang general dan pengetahuan umum agar anak lebih mudah memahami",
        "Wajar bahwa anak cenderung ingin tahu mengenai hal-hal tersebut sehingga lebih baik jika dijelaskan dengan pengawasan orang tua.\n\nJelaskan juga mengenai hal-hal yang general dan pengetahuan umum agar anak lebih mudah memahami. Hal ini penting dilakukan agar dapat membantu mengurangi rasa penasaran anak serta pengenalan kepada anak sebelum terpapar oleh hal-hal yang negatif",
        "Hal tersebut akan membuat anak merasa tertekan dan tidak ingin bertanya lebih lanjut tentang hal lainnya.\n\nWajar bahwa anak cenderung ingin tahu mengenai hal-hal tersebut sehingga lebih baik jika dijelaskan dengan pengawasan orang tua. Jelaskan juga mengenai hal-hal yang general dan pengetahuan umum agar anak lebih mudah memahami."
        ],
        tips: "Biasakan mencoba menjawab semua pertanyaan anak dan melakukan pencarian bersama jika ingin mendapatkan data yang lebih jelas. Contohnya dapat melalui video animasi yang menjelaskan mengenai hal tersebut.",
        correctAns: 1
    )
]
