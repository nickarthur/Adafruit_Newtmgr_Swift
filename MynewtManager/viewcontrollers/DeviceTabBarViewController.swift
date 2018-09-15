

import UIKit

class DeviceTabBarViewController: UITabBarController {
    
    // Parameters
    weak var blePeripheral: BlePeripheral? {
        // Send to tabs view controllers
        didSet {
            if let viewControllers = viewControllers {
                for viewController in viewControllers {
                    if let newtViewController = viewController as? MynewtViewController {
                        newtViewController.blePeripheral = blePeripheral
                    }
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup
        guard let peripheral = blePeripheral else {
            DLog("Error: Peripheral is undefined")
            return
        }
        
        peripheral.newtInit() { [weak self] error in
            guard let context = self else {
                return
            }
// MARK: - BEGIN NANDEBUG
//            guard error == nil else {
//                DLog("Newt setup error: \(error!)")
//
//                DispatchQueue.main.async {
//                    showErrorAlert(from: context, title: "Error", message: "Error initializing Newt service") { [unowned context] _ in
//                        // Go back to scanning controller
//                        _ = context.navigationController?.popToRootViewController(animated: true)
//                    }
//                }
//
//                BleManager.sharedInstance.disconnect(from: peripheral)
//                return
//            }
// MARK: - BEGIN NANDEBUG
            
            if let context = self, let newtController = context.selectedViewController as? MynewtViewController {
                DispatchQueue.main.async {
                    newtController.newtDidBecomeReady()
                }
            }
        }
        
        #if DEBUG
        #else
            // Remove Debug commands view
            viewControllers?.removeLast()
        #endif
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    deinit {
        if let peripheral = blePeripheral {
            BleManager.sharedInstance.disconnect(from: peripheral)
        }
        else {
            DLog("Cannot disconnect because peripheral is undefined")
        }
    }

}
