import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // create the User object entity
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
        // configure the object
        user.setValue("Souza", forKey: "name")
        user.setValue(29, forKey: "age")
        user.setValue("matheusevangelista", forKey: "login")
        user.setValue("1234", forKey: "password")
        
        // save User data
        do {
            try context.save()
            print("Dados salvos com sucesso")
        } catch {
            print("Erro ao salvar os dados: \(error.localizedDescription)")
        }
    }
    
}
