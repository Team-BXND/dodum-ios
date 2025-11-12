//
//  ShareViewModel.swift
//  dodum-iOS
//
//  Created by 잇쬬 on 10/27/25.
//

import SwiftUI
import UIKit

class ShareViewModel: ObservableObject {
    @Published var Sharearr: [ShareModel] = [
        ShareModel(category: "ahha",title: "yaho", subtitle: "hihi", content: "haha", imageName: "..", authorRole: 2, isAnonymous: true),
        ShareModel(category: "ahha",title: "yaho", subtitle: "hihi", content: "haha", imageName: "..", authorRole: 2, isAnonymous: true)
    ]
    
    func addPost(category: String, title: String, subtitle: String, content: String, imageName: String, authorRole: Int, isAnonymous: Bool) {
        let newPost = ShareModel(category: category, title: title, subtitle: subtitle, content: content, imageName: imageName, authorRole: authorRole, isAnonymous: isAnonymous)
        Sharearr.append(newPost)
    }
    
    func toggleBold(for attributedText: inout NSAttributedString, in selectedRange: NSRange) {
        let mutable = NSMutableAttributedString(attributedString: attributedText)
        mutable.enumerateAttributes(in: selectedRange, options: []) { attrs, range, _ in
            var newAttrs = attrs
            let currentFont = (attrs[.font] as? UIFont) ?? UIFont.systemFont(ofSize: 17)
            var traits = currentFont.fontDescriptor.symbolicTraits
            if traits.contains(.traitBold) {
                traits.remove(.traitBold)
            } else {
                traits.insert(.traitBold)
            }
            if let descriptor = currentFont.fontDescriptor.withSymbolicTraits(traits) {
                let newFont = UIFont(descriptor: descriptor, size: 17)
                newAttrs[.font] = newFont
                mutable.setAttributes(newAttrs, range: range)
            }
        }
        attributedText = mutable
    }
    
    func toggleItalic(for attributedText: inout NSAttributedString, in selectedRange: NSRange) {
        let mutable = NSMutableAttributedString(attributedString: attributedText)
        mutable.enumerateAttributes(in: selectedRange, options: []) { attrs, range, _ in
            var newAttrs = attrs
            let currentFont = (attrs[.font] as? UIFont) ?? UIFont.systemFont(ofSize: 17)
            var traits = currentFont.fontDescriptor.symbolicTraits
            if traits.contains(.traitItalic) {
                traits.remove(.traitItalic)
            } else {
                traits.insert(.traitItalic)
            }
            if let descriptor = currentFont.fontDescriptor.withSymbolicTraits(traits) {
                let newFont = UIFont(descriptor: descriptor, size: 17)
                newAttrs[.font] = newFont
                mutable.setAttributes(newAttrs, range: range)
            }
        }
        attributedText = mutable
    }
    
    func toggleUnderline(for attributedText: inout NSAttributedString, in selectedRange: NSRange) {
        let mutable = NSMutableAttributedString(attributedString: attributedText)
        mutable.enumerateAttributes(in: selectedRange, options: []) { attrs, range, _ in
            var newAttrs = attrs
            let currentStyle = attrs[.underlineStyle] as? Int ?? 0
            if currentStyle == 0 {
                newAttrs[.underlineStyle] = NSUnderlineStyle.single.rawValue
            } else {
                newAttrs.removeValue(forKey: .underlineStyle)
            }
            mutable.setAttributes(newAttrs, range: range)
        }
        attributedText = mutable
    }
    
    func insertImage(_ image: UIImage, into attributedText: inout NSAttributedString, at range: NSRange) {
        let attachment = NSTextAttachment()
        attachment.image = image
        let maxWidth: CGFloat = UIScreen.main.bounds.width - 80
        let ratio = image.size.height / image.size.width
        let adjustedSize = CGSize(width: maxWidth, height: maxWidth * ratio)
        attachment.bounds = CGRect(x: 0, y: 0, width: adjustedSize.width - 16, height: adjustedSize.height)
        
        let imageString = NSMutableAttributedString(attachment: attachment)
        imageString.append(NSAttributedString(string: " "))
        
        let mutable = NSMutableAttributedString(attributedString: attributedText)
        mutable.replaceCharacters(in: range, with: imageString)
        attributedText = mutable
    }
}

struct RichTextEditor: UIViewRepresentable {
    @Binding var attributedText: NSAttributedString
    @Binding var selectedRange: NSRange
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.isEditable = true
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.backgroundColor = .clear
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.attributedText != attributedText {
            uiView.attributedText = attributedText
        }
        uiView.selectedRange = selectedRange
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: RichTextEditor
        
        init(_ parent: RichTextEditor) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.attributedText = textView.attributedText
        }
        
        func textViewDidChangeSelection(_ textView: UITextView) {
            parent.selectedRange = textView.selectedRange
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.dismiss) var dismiss
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            parent.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}
