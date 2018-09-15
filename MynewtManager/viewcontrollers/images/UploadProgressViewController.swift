

import UIKit

protocol UploadProgressViewControllerDelegate: class {
    func onUploadCancel()
}

class UploadProgressViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var imageSizeLabel: UILabel!
    
    weak var delegate: UploadProgressViewControllerDelegate?
    var imageName: String?
    var imageSize: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // UI
        dialogView.layer.cornerRadius = 8
        dialogView.layer.masksToBounds = true
        
        // Initial state
        imageNameLabel.text = imageName
        imageSizeLabel.text = imageSize
        set(progress: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func set(progress: Float) {
        progressView.progress = progress
        progressLabel.text = String(format: "%.1f%%", progress * 100.0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onClickCancel(_ sender: Any) {
        delegate?.onUploadCancel()
    }
}
