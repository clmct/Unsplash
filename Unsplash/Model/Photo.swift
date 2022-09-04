import Foundation
import UIKit

typealias Photos = [Photo]

struct Photo: Codable {
  let id: String
  let width: Int
  let height: Int
  let location: Location?
  let urls: [URLKing.RawValue: String]
  let user: User?
}

enum URLKing: String {
  case raw
  case full
  case regular
  case small
  case thumb
}

struct Location: Codable {
  let name: String?
}

struct User: Codable {
  let username: String?
  let name: String?
}
