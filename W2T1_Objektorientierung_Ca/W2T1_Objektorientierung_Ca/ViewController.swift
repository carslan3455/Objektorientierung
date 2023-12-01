import UIKit

class ViewController: UIViewController {
    
    //===========================================
    
    /*
     * Eine Struktur aehnelt einer Klasse. Dennoch gibt es wichtige
     * Unterschiede:
     * 1) Eine Struktur ist ein Wertetyp, d.h. es wird bei der
     *    Uebergabe als Kopie uebergeben
     * 2) Eine Struktur kann nicht von einer Klasse oder einer
     *    anderen Struktur erben
     */
    struct Bundesland
    {
        var name: String? = nil
        var hauptstadt: String? = nil
        var einwohner: Int? = nil
               
       
        
        var description: String
        {
            let formater = NumberFormatter()
            formater.numberStyle = .decimal
            
            return "\n\(name!), \(hauptstadt!), \(formater.string(for: einwohner!)!.replacingOccurrences(of: ",", with: ".")) Einwohner\n"
        }
        
        /*
         * Funktionen in einer Struktur duerfen standardmaeßig
         * keine Attribute aendern. Soll dies trotzdem geschehen,
         * muss die Methode mit dem Schluesselwort "mutating"
         * gekennzeichnet werden.
         */
        mutating func setEinwohner(einwohner: Int)
        {
            self.einwohner = einwohner
        }
    }
    
    //===========================================
    
    
    class Person
    {
        private var vorname, nachname: String
        
        init(vorname: String, nachname: String) {
            self.vorname = vorname
            self.nachname = nachname
        }
        
        
        var description: String
        {
            return nachname + ", " + vorname
        }
        
        /*
         * In Swift koennen - wie in fast allen C-basierten Sprachen -
         * Operatoren ueberladen werden. Hier dient das Plus der
         * Verknuepfung zweier Personen.
         */        
        static func + (p1: Person, p2: Person) -> Person
        {
            let v = p1.vorname + "-" + p2.vorname
            let n = p1.nachname + "-" + p2.nachname
            
            return Person(vorname: v, nachname: n)
            
        }
        
        func getVorname() -> String
        {
            return vorname
        }
        
        func getNachname() -> String
        {
            return nachname
        }
    }
    
    //===========================================
    
    private let tv: UITextView =
    {
        let tv = UITextView()
        tv.backgroundColor = .white
        tv.textColor = .black
        tv.layer.cornerRadius = 7
        tv.layer.borderWidth = 1
        tv.clipsToBounds = true
        tv.isEditable = false
        tv.font = UIFont.systemFont(ofSize: 17)
        return tv
    }()
    
    //--------------------------------------------
    
    private func structDemo()
    {
    
        var nds = Bundesland()
        nds.name = "Niedersachsen"
        nds.hauptstadt = "Hannover"
        nds.einwohner = 7_982_488
        
        /*
         * Ein Struct hat die Funktionalitaet, dass - wie bei
         * einem Konstruktor - die Attribute gesetzt werden koennen.
         */
        var nrw = Bundesland(name: "Nordrhein-Westfallen", hauptstadt: "Duesseldorf", einwohner: 123)
        
        nrw.setEinwohner(einwohner: 17_932_651)
        
        tv.text += "nds= \(nds)\n"
        tv.text += "nrw= \(nrw)\n"
        
        tv.text += nds.description + "\n"
        
    }
    
    //--------------------------------------------
    
    private func classDemo()
    {
        let p1: Person = Person(vorname: "Bud", nachname: "Spencer")
        let p2: Person = Person(vorname: "Terence", nachname: "Hill")
        
        tv.text += p1.description + "\n"
        tv.text += p2.description + "\n"
        
        let p3: Person = p1 + p2
        tv.text += p3.description + "\n"
        tv.text += p3.getVorname() + "\n"
        tv.text += p3.getNachname() + "\n"
    }
    
    //--------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        view.addSubview(tv)
        tv.frame = CGRect(x: 20, y: 70, width: view.frame.width - 40, height: view.frame.height - 70 - 50)
        
        structDemo()
        classDemo()
       
    }


}

