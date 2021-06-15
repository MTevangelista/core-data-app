import UIKit
import CoreData

class AnotationViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.becomeFirstResponder()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func btnSave(_ sender: Any) {
        self.saveAnotation()
        self.navigationController?.popViewController(animated: true)
    }
    
    private func saveAnotation() {
        let newAnotation = NSEntityDescription.insertNewObject(forEntityName: "Anotation", into: context)
        
        newAnotation.setValue(self.textView.text, forKey: "text")
        newAnotation.setValue(Date(), forKey: "data")
        
        do {
            try context.save()
            print("Sucesso ao salvar anotação!")
        } catch let erro {
            print("Erro ao salvar anotação: \(erro.localizedDescription)")
        }
    }

}
