import UIKit

class TipsMenuViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 7
        pageControl.backgroundColor = #colorLiteral(red: 1, green: 0.9803921569, blue: 0.968627451, alpha: 1)
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.9361029863, green: 0.444816947, blue: 0.2520878911, alpha: 0.5522795377)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.9361029863, green: 0.444816947, blue: 0.2520878911, alpha: 1)
        return pageControl
    }()
    var questions = ["Pendidikan seksualitas tidak mendorong perilaku seks bebas" ,
    "Istilah yang tepat untuk digunakan untuk menjelaskan bagian privat" ,
    "Memulai percakapan mengenai pendidikan seksualitas" ,
    "Bagaimana sebaiknya menanggapi pertanyaan anak?",

    "Menjawab pertanyaan sulit dari anak" ,
    "Bagaimana kalau saya tidak tahu jawabannya?",
    "Bagaimana saya tahu anak saya sudah mengerti?"]
    

    
    var tips = ["Penting bagi orang tua untuk berbicara dan berdiskusi dengan anak mengenai pendidikan seksualitas.\n \nBanyak riset menunjukkan bahwa saat orang tua berbicara kepada anak mengenai seksualitas, anak-anak akan bisa membuat keputusan yang lebih baik terkait dengan hubungan dan seksualitas. "
                ,

                "Sebaiknya, gunakan istilah yang benar untuk menggambarkan bagian tubuh, termasuk anggota tubuh yang privat seperti payudara, vagina, penis, dan lainnya.\n\nTujuannya adalah agar anak bisa memahami, mengindentifikasi, dan merasa nyaman dengan tubuhnya sendiri.\nApabila merasa kurang nyaman, Anda bisa menggunakan istilah yang lebih familiar.  \nNamun, sebaiknya jangan menggunakan istilah yang mengarah ke lelucon atau konotasi yang kurang tepat, misalnya menyebut penis sebagai 'burung'. "
                 ,

                "Anda tidak harus menunggu anak bertanya lho! Manfaatkan momen sehari-hari untuk berdiskusi dengan anak.\n\nSaat menjelaskan, berikan contoh positif agar anak tidak merasa khawatir atau takut.\nAnda tidak harus membahas semuanya dalam satu percakapan. \n\nKata-kata yang bisa Anda gunakan:\n‘Kamu tahu atau tidak mengenai …?’\n‘Menurutmu bagaimana?’\n‘Ayah/Ibu mau diskusi dong sama kamu.’"

                ,
                "Berikan respons dengan tenang & terbuka agar anak merasa aman untuk bertanya. Anda juga bisa memberi pujian mengenai rasa ingin tahu anak. \n\nSaat mendapat pertanyaan, Anda bisa menanyakan terlebih dahulu mengenai apa yang mereka sudah ketahui dan apa yang ingin mereka ketahui lebih lanjut untuk menilai kesiapan anak.\n\nKata-kata yang bisa Anda gunakan:\n‘Menurutmu bagaimana?’\n‘Penasaran mengenai tubuh kita sendiri itu wajar kok.’"

                ,
                "Berikan jawaban yang sederhana, jujur, dan sesuai fakta. Berikan kesempatan pada anak untuk mengekspresikan diri & hargai pendapat mereka.\n\nKemudian tanyakan apakah penjelasan Anda menjawab pertanyaan mereka dan apakah mereka punya pertanyaan lain.\n\nKata-kata yang bisa Anda gunakan:\n‘Ayah/Ibu tau, tapi masih bingung cara menjelaskannya ke kamu. Nanti ayah/ibu cari tahu dulu ya.’"
                ,
               
                "Tidak apa-apa! Akui saat Anda tidak tahu jawabannya.\n\nAnda juga bisa mengajak anak untuk bersama-sama mencari tahu.\n\nKata-kata yang bisa Anda gunakan: ‘Ayah atau Ibu belum tahu jawabannya. Nanti ayah/ibu cari tahu dulu ya.’",
                "Usahakan untuk melakukan diskusi alih-alih menjelaskan satu arah. Setelah memberi penjelasan, tanyakan pendapat mereka.\n\nMisalnya dengan menanyakan hal baru apa yang dipelajari, tanggapan, ataupun perasaan mereka. Beritahu bahwa mereka bisa datang kepada Anda apabila ada hal lain yang ingin ditanyakan.\n\nAnda juga bisa mendiskusikan bahwa kadang-kadang anak juga perlu berbicara dengan orang dewasa lainnya Bersama-sama, pikirkan orang dewasa yang dapat mereka ajak bicara."]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Tips"

        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        scrollView.backgroundColor = #colorLiteral(red: 1, green: 0.9803921569, blue: 0.968627451, alpha: 1)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        // Do any additional setup after loading the view.
    }
    @objc private func pageControlDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x:10,y: view.frame.size.height-100,width: view.frame.size.width-20,height: 70)
        scrollView.frame = CGRect(x:0,y:0, width: view.frame.size.width,height: view.frame.size.height)
        if scrollView.subviews.count == 2{
            configureScrollView()
        }
    }
    private func configureScrollView(){
        scrollView.contentSize = CGSize(width: view.frame.size.width * 7, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
     
        
        
        for x in 0..<7
        {
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width,y:0,width: view.frame.size.width,height: view.frame.size.height))
            
            let questionLabel = UILabel(frame: CGRect(x: 16, y: 105, width: 358, height: 62))

            questionLabel.textAlignment = .center
            questionLabel.font = .boldSystemFont(ofSize: 17)
            questionLabel.text = questions[x]
            questionLabel.numberOfLines = 40
        
            let tipsLabel = UILabel(frame: CGRect(x: 30, y: 391, width: 331, height: 367))
      
            tipsLabel.textAlignment = .justified
            tipsLabel.text = tips[x]
            tipsLabel.numberOfLines = 40
            let mascot = UIImageView(frame: CGRect(x: 61, y: 175, width: 268, height: 190))
            mascot.image = #imageLiteral(resourceName: "Tips")
            mascot.contentMode = .scaleAspectFit
            page.addSubview(questionLabel)
            page.addSubview(tipsLabel)
            page.addSubview(mascot)
            scrollView.addSubview(page)
        }
    }



}
extension TipsMenuViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int (floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
        
    }
}
