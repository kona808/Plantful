//
//  APIService.swift
//  Plantful
//
//  Created by Jacob Perez on 11/29/22.
//

import UIKit

struct APIService {
    var API_KEY = "2b10peENdIEf4Dth90aUmufHn"
    
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.requestError(error)))
            }
            if let response = response as? HTTPURLResponse {
                print("\(response.statusCode)")
            }
            guard let data = data else {
                completion(.failure(.couldNotUnwrap))
                return
            }
            completion(.success(data))
        }.resume()
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
    func uploadImageToServer(imageToUpload: UIImage) { // update function declaration to complete with an array of plants or an error
        // MUST BE "images"
       guard let mediaImage = Media(withImage:imageToUpload, forKey: "images") else { return }
       guard let url = URL(string: "https://my-api.plantnet.org/v2/identify/all?include-related-images=false&no-reject=false&lang=en&api-key=2b10peENdIEf4Dth90aUmufHn") else { return }
       var request = URLRequest(url: url)
       request.httpMethod = "POST"
       //create boundary
       let boundary = generateBoundary()
       //set content type
       request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
       //call createDataBody method
       let dataBody = createDataBody(media: [mediaImage], boundary: boundary)
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
                print(json) // Need to update this to create plant object
             } catch {
                print(error)
             }
          }
       }.resume()
    }
}
extension Data {
   mutating func append(_ string: String) {
      if let data = string.data(using: .utf8) {
         append(data)
         print("data======>>>",data)
      }
   }
}
