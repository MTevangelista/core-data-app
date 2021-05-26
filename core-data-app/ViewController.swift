import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //saveProduct(context)
        getAllProducts(context)
        
        //saveUser(context)
        //getAllUsers(context)
    }
    
    private func saveProduct(_ context: NSManagedObjectContext) {
        let product = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
        
        product.setValue("MacBook Pro 15", forKey: "bio")
        product.setValue("White", forKey: "color")
        product.setValue(1999.5, forKey: "price")
        
        do {
            try context.save()
            print("Dados salvos com sucesso")
        } catch {
            print("Erro ao salvar os dados: \(error.localizedDescription)")
        }
    }
    
    private func getAllProducts(_ context: NSManagedObjectContext) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        
        do {
            let products = try context.fetch(request) as! [NSManagedObject]
            
            if products.count > 0 {
                for product in products {
                    guard
                        let productBio = product.value(forKey: "bio"),
                        let productColor = product.value(forKey: "color"),
                        let productPrice = product.value(forKey: "price")
                    else { return }
                    print("Nome: \(productBio) / Cor: \(productColor) / Preço: \(productPrice)")
                }
            }
        } catch {
            print("Erro ao recuperar os usuários")
        }
    }
    
    private func saveUser(_ context: NSManagedObjectContext) {
        // create the User object entity
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
        // configure the object
        user.setValue("Souza", forKey: "name")
        user.setValue(22, forKey: "age")
        user.setValue("souzarj", forKey: "login")
        user.setValue("1234", forKey: "password")
        
        // save User data
        do {
            try context.save()
            print("Dados salvos com sucesso")
        } catch {
            print("Erro ao salvar os dados: \(error.localizedDescription)")
        }
    }
    
    private func getAllUsers( _ context: NSManagedObjectContext) {
        // create request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do {
            let usuarios = try context.fetch(request) as! [NSManagedObject]
            
            if usuarios.count > 0 {
                for usuario in usuarios {
                    guard let userName = usuario.value(forKey: "name") else { return }
                    print(userName)
                }
            } else {
                print("Nenhum usuário encontrado")
            }
        } catch  {
            print("Erro ao recuperar os usuários")
        }

    }
}
