//
//  Media.swift
//  Plantful
//
//  Created by Jacob Perez on 11/28/22.
//

import UIKit

var API_KEY = "2b10peENdIEf4Dth90aUmufHn"

func recognizeImages() {
    //Try to create the api endpoint url
    guard let apiEndpoint = URL(string: "https://my-api.plantnet.org/v2/identify/all?include-related-images=false&no-reject=false&lang=en&api-key=2b10peENdIEf4Dth90aUmufHn") else {print("URL DID NOT WORK"); return }

    //Convert the UIImages to jpeg
//    let imagesJPG = convertImagesToJPEG(images: images)
    let testImage = UIImage(named: "image_1.jpeg")
//    guard let imagesJPG = testImage?.jpegData(compressionQuality: 0.0) else { print("No IMAGE JPG Data");return}

    //Create url request
    var request = URLRequest(url: apiEndpoint)

    //Set the http method to post (local images)
    request.httpMethod = "POST"

    //Create boundary which marks the start/end of the request body
//    let boundary = "Boundary-\(UUID().uuidString)"
    let boundary = UUID().uuidString

    //Set value for our specific http header field
    request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

    //Set the mime type to jpg (we will convert our UIImages to jpg)
    let mimeType = "image/jpg"

    //Create http body
    var body = Data()
    var param = "flower"
//    let boundaryPrefix = " — \(boundary)\r\n"
    //Add the parameter to the body (Currently just leaf recognition is possible)
    body.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
    body.append("Content-Disposition: form-data; name=\"\(param)\"; filename=\"imagefile.jpg\"r\n".data(using: .utf8)!)
//    body.append("leaf\r\n")
    body.append("Content-Type: image.jpg\r\n\r\n".data(using: .utf8)!)
//    body.append(testImage!.jpgData(compressionQuality: 1.0)!)
    body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
//    var filename = String()
//    for (index,data) in imagesJPG.enumerated(){
//        filename = "image\(index)"
//        body.append(boundaryPrefix)
//        body.append("Content-Disposition: form-data; name=\"image[]\"; filename=\"\(filename)\"\r\n")
//        body.append("Content-Type: \(mimeType)\r\n\r\n")
//        body.append(data)
//        body.append("\r\n")
//    }
//
//    body.append("--\(boundary)--\r\n")
//

    //Post the request
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
        if let response = response {
            print(response)
        }

        if let data = data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }
    }.resume()
}

recognizeImages()

struct Media {
    let key: String
    let filename: String
    let data: Data
    let mimeType: String
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        self.mimeType = "images/jpeg"
        self.filename = "imagefile.jpg"
        guard let data = image.jpegData(compressionQuality: 0.7) else { return nil }
        self.data = data
    }
}
func generateBoundary() -> String {
   return "Boundary-\(NSUUID().uuidString)"
}

func createDataBody(media: [Media]?, boundary: String) -> Data {
   let lineBreak = "\r\n"
   var body = Data()
//   if let parameters = params {
//      for (key, value) in parameters {
//         body.append("--\(boundary + lineBreak)")
//         body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
//         body.append("\(value as! String + lineBreak)")
//      }
//   }
   if let media = media {
      for photo in media {
         body.append("--\(boundary + lineBreak)")
         body.append("Content-Disposition: form-data; name=\"\(photo.key)\"; filename=\"\(photo.filename)\"\(lineBreak)")
         body.append("Content-Type: \(photo.mimeType + lineBreak + lineBreak)")
         body.append(photo.data)
         body.append(lineBreak)
      }
   }
   body.append("--\(boundary)--\(lineBreak)")
    print(body)
   return body
}

func uploadImageToServer() {
//   let parameters = ["name": "MyTestFile123321",
//                     "id": "12345"]
    let testImage = UIImage(named: "image_1.jpeg")
    let testImage2 = UIImage(named: "testImage2.jpeg")
    // MUST BE "images"
   guard let mediaImage = Media(withImage:testImage!, forKey: "images") else { return }
    guard let mediaImage2 = Media(withImage:testImage!, forKey: "images") else { return }
   guard let url = URL(string: "https://my-api.plantnet.org/v2/identify/all?include-related-images=false&no-reject=false&lang=en&api-key=2b10peENdIEf4Dth90aUmufHn") else { return }
   var request = URLRequest(url: url)
   request.httpMethod = "POST"
   //create boundary
   let boundary = generateBoundary()
   //set content type
   request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
   //call createDataBody method
   let dataBody = createDataBody(media: [mediaImage2], boundary: boundary)
   request.httpBody = dataBody
    print("DAAAAAATTTTAAAA BODY:", dataBody.description)
   let session = URLSession.shared
   session.dataTask(with: request) { (data, response, error) in
      if let response = response {
         print(response)
      }
      if let data = data {
         do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json)
         } catch {
            print(error)
         }
      }
   }.resume()
}
extension Data {
   mutating func append(_ string: String) {
      if let data = string.data(using: .utf8) {
         append(data)
         print("data======>>>",data)
      }
   }
}
//uploadImageToServer()
