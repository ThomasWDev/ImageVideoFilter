//
//  VideoPlayerVC.swift
//  PhotoFilter
//
//  Created by Thomas Woodfin on 12/9/20.
//

import UIKit
import GPVideoPlayer

class VideoPlayerVC: UIViewController {
    
    @IBOutlet weak private var mediaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVideo()
    }
    
    private func setupVideo(){
        if let player = GPVideoPlayer.initialize(with: self.mediaView.bounds) {
            player.isToShowPlaybackControls = true
            
            self.mediaView.addSubview(player)
            
            let url1 = URL(string: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.mp4")!
//            let videoFilePath = Bundle.main.path(forResource: "video", ofType: "mp4")
//            let url2 = URL(fileURLWithPath: videoFilePath!)
            
            player.loadVideos(with: [url1])
            player.isToShowPlaybackControls = true
            player.isMuted = true
            player.playVideo()
        }
    }
    
    @IBAction func photoFilterAction(_ sender: Any) {
        showImageFilterVC()
    }
    
    private func showImageFilterVC(){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PhotoFilterVC") as? PhotoFilterVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
