import UIKit
import SwiftFilePath

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // セルに表示するテキスト
    var files: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        files = getFiles()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return files.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = files[indexPath.row]
        return cell
    }

    func getFiles() -> Array<String> {
        files.append("--home--")
        let homeDirsFullPath = Path.homeDir.contents!
        print(homeDirsFullPath)
        for fullPath in homeDirsFullPath {
            let url = NSURL(string: fullPath.toString())
            _ = url?.pathExtension
            let filename = url?.lastPathComponent
            if (filename != nil) {
                files.append(filename!)
            }
        }

        files.append("--Documents--")
        let documentsFolder = Path.documentsDir.contents!
        print(documentsFolder)
        for filePath in documentsFolder {
            let url = NSURL(string: filePath.toString())
            _ = url?.pathExtension
            let filename = url?.lastPathComponent
            if (filename != nil) {
                files.append(filename!)
            }
        }

        files.append("--Library--")
        let libraryFolder = Path.homeDir["Library"].contents!
        print(libraryFolder)
        for filePath in libraryFolder {
            let url = NSURL(string: filePath.toString())
            _ = url?.pathExtension
            let filename: String? = url?.lastPathComponent
            if (filename != nil) {
                files.append(filename!)
            }
        }

        files.append("--Library/Caches--")
        let libraryCachesFolder = Path.cacheDir.contents!
        print(libraryCachesFolder)
        for filePath in libraryCachesFolder {
            let url = NSURL(string: filePath.toString())
            _ = url?.pathExtension
            let filename = url?.lastPathComponent
            if (filename != nil) {
                files.append(filename!)
            }
        }

        files.append("--Library/tmp--")
        let libraryTmpFolder = Path.temporaryDir.contents!
        print(libraryTmpFolder)
        for filePath in libraryTmpFolder {
            let url = NSURL(string: filePath.toString())
            _ = url?.pathExtension
            let filename = url?.lastPathComponent
            if (filename != nil) {
                files.append(filename!)
            }
        }

        files.append("--Library/Preferences--")
        let libraryPreferencesFolder = Path.homeDir["Library"]["Preferences"].contents!
        print(libraryPreferencesFolder)
        for filePath in libraryPreferencesFolder {
            let url = NSURL(string: filePath.toString())
            _ = url?.pathExtension
            let filename: String? = url?.lastPathComponent
            if (filename != nil) {
                files.append(filename!)
            }
        }

        files.append("--tmp--")
        let tmpFolder = Path.homeDir["tmp"].contents!
        print(tmpFolder)
        for filePath in tmpFolder {
            let url = NSURL(string: filePath.toString())
            _ = url?.pathExtension
            let filename = url?.lastPathComponent
            if (filename != nil) {
                files.append(filename!)
            }
        }

        print(files)
        return files
    }
}