

import UIKit

func showErrorAlert(from controller: UIViewController, title: String?, message: String?, okHandler: ((UIAlertAction) -> Void)? = nil) {

    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default, handler: okHandler)
    alertController.addAction(okAction)
    controller.present(alertController, animated: true, completion: nil)
}
