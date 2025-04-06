import Foundation
import Testing
import HTML_Attributes
import HTML_Elements
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Audio Element Tests"
)
struct AudioTests {
    
    @Test("Create basic audio with src and controls")
    func createBasicAudio() {
        let a = Audio<String>(
            src: "audio-file.mp3",
            controls: true,
            content: { "Your browser does not support the audio element." }
        )
        
        #expect(a.src == "audio-file.mp3")
        #expect(a.controls == true)
        #expect(a.content() == "Your browser does not support the audio element.")
    }
    
    @Test("Create audio with multiple attributes")
    func createAudioWithMultipleAttributes() {
        let a = Audio<String>(
            src: "audio-file.mp3",
            controls: true,
            autoplay: true,
            loop: true,
            muted: true,
            preload: .metadata,
            content: { "Fallback content" }
        )
        
        #expect(a.src == "audio-file.mp3")
        #expect(a.controls == true)
        #expect(a.autoplay == true)
        #expect(a.loop == true)
        #expect(a.muted == true)
        #expect(a.preload == .metadata)
        #expect(a.content() == "Fallback content")
    }
    
    @Test("Create audio with preload options")
    func createAudioWithPreloadOptions() {
        let none = Audio<String>(
            src: "audio.mp3",
            preload: Audio<String>.Preload.none,
            content: { "" }
        )
        
        let metadata = Audio<String>(
            src: "audio.mp3",
            preload: .metadata,
            content: { "" }
        )
        
        let auto = Audio<String>(
            src: "audio.mp3",
            preload: .auto,
            content: { "" }
        )
        
        #expect(none.preload == Audio.Preload.none)
        #expect(metadata.preload == .metadata)
        #expect(auto.preload == .auto)
    }
    
    @Test("Create audio with controlslist")
    func createAudioWithControlsList() {
        let controlsList = Audio<String>.ControlsList(
            nodownload: true,
            nofullscreen: true,
            noremoteplayback: true
        )
        
        let a = Audio<String>(
            src: "audio.mp3",
            controls: true,
            controlslist: controlsList,
            content: { "" }
        )
        
        #expect(a.controlslist?.nodownload == true)
        #expect(a.controlslist?.nofullscreen == true)
        #expect(a.controlslist?.noremoteplayback == true)
        #expect(a.controlslist?.description == "nodownload nofullscreen noremoteplayback")
    }
    
    @Test("Create audio with lowercase typealias")
    func createAudioWithLowercaseTypealias() {
        let a = audio<String>(
            src: "audio.mp3",
            controls: true,
            content: { "Fallback content" }
        )
        
        #expect(a.src == "audio.mp3")
        #expect(a.controls == true)
        #expect(a.content() == "Fallback content")
    }
    
    @Test("Create audio without src for multiple sources")
    func createAudioWithoutSrc() {
        let a = Audio<String>(
            controls: true,
            content: {
                "source1" +
                "source2" +
                "Fallback content"
            }
        )
        
        #expect(a.src == nil)
        #expect(a.controls == true)
        #expect(a.content() == "source1source2Fallback content")
    }
    
    @Test("Test controlslist with partial options")
    func testControlsListWithPartialOptions() {
        let downloadOnly = Audio<String>.ControlsList(nodownload: true)
        let fullscreenOnly = Audio<String>.ControlsList(nofullscreen: true)
        let remoteOnly = Audio<String>.ControlsList(noremoteplayback: true)
        
        #expect(downloadOnly.description == "nodownload")
        #expect(fullscreenOnly.description == "nofullscreen")
        #expect(remoteOnly.description == "noremoteplayback")
        
        let combined = Audio<String>.ControlsList(nodownload: true, noremoteplayback: true)
        #expect(combined.description == "nodownload noremoteplayback")
    }
}
