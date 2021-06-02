import UIKit
import CoreData

class Ex: UIViewController {
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
        
        product.setValue("acer aspire 15", forKey: "bio")
        product.setValue("Branco", forKey: "color")
        product.setValue(159, forKey: "price")
        
        do {
            try context.save()
            print("Dados salvos com sucesso")
        } catch {
            print("Erro ao salvar os dados: \(error.localizedDescription)")
        }
    }
    
    private func getAllProducts(_ context: NSManagedObjectContext) {
        // create request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        
        // sort A-Z OR Z-A
        let sortByBio = NSSortDescriptor(key: "bio", ascending: true)
        
        // Apply filters
        //let predicate = NSPredicate(format: "bio == %@", "Acer")
        //let predicate = NSPredicate(format: "bio contains [c] %@", "acer")
        //let predicate = NSPredicate(format: "bio beginswith [c] %@", "ace")
        
        //let bioFilter = NSPredicate(format: "bio contains [c] %@", "pho")
        //let priceFilter = NSPredicate(format: "price >= %@", "89.99")
        //let matchedFilters = NSCompoundPredicate(andPredicateWithSubpredicates: [bioFilter, priceFilter])
        
        //let predicate = NSPredicate(format: "bio == %@", "Acer Aspire 15")
        
        // Apply created filters to the request
        request.sortDescriptors = [sortByBio]
        //request.predicate = predicate
        
        do {
            let products = try context.fetch(request) as! [NSManagedObject]
            
            if products.count > 0 {
                for product in products {
                    guard
                        let productBio = product.value(forKey: "bio"),
                        let productColor = product.value(forKey: "color"),
                        let productPrice = product.value(forKey: "price")
                    else { return }
                    print("Nome: \(productBio) | Cor: \(productColor) | Preço: \(productPrice)")
                    
                    // Remove Product
//                    context.delete(product)
//                    do {
//                        try context.save()
//                        print("Sucesso ao remover produto")
//                    } catch {
//                        print("Erro ao remover o produto: \(error.localizedDescription)")
//                    }
                    
                    // Updatae Product
//                    product.setValue(220.50, forKey: "price")
//                    do {
//                        try context.save()
//                        print("Sucesso ao atualizar os produtos")
//                    } catch {
//                        print("Erro ao atualizar o produto: \(error.localizedDescription)")
//                    }
                }
            }
        } catch {
            print("Erro ao recuperar os produtos")
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
