import Foundation
import UIKit

// Request struct

struct FilterData: Codable {
    let data: FilterInfo
}

struct FilterInfo: Codable {
    let filterRadius: FilterRadius
}

struct FilterRadius: Codable {
    let miles: Int
    let postalcode: Int
}

// Response structs

struct AnimalData: Codable {
    let data: [Animal]
    let included: [Included]
}

struct Animal: Codable, Hashable {
    let attributes: AnimalAttributes

    static var example: Animal {
        let attributes = AnimalAttributes(
            ageGroup: "Young",
            ageString: "1",
            birthDate: "February 1",
            breedPrimary: "Bulldog",
            breedSecondary: "Poodle",
            colorDetails: "Brown and white",
            descriptionText: "Looks like my cousin's ugly dog. Has a good heart though.",
            name: "Monster",
            pictureThumbnailUrl: "https://cdn.rescuegroups.org/16/pictures/animals/100/100000/175990.jpg?width=100",
            sex: "Male",
            sizeUOM: "Pounds",
            createdDate: "2008",
            updatedDate: "2010"
        )

        return Animal(attributes: attributes)
    }
}

struct AnimalAttributes: Codable, Hashable {
    let ageGroup: String?
    let ageString: String?
    let birthDate: String?
    let breedPrimary: String?
    let breedSecondary: String?
    let colorDetails: String?
    let descriptionText: String?
    let name: String?
    let pictureThumbnailUrl: String?
    let sex: String?
    let sizeUOM: String?
    let createdDate, updatedDate: String?
}

struct Included: Codable, Hashable {
    let attributes: IncludedAttributes

    static var example: Included {
        let attributes = IncludedAttributes(
            phone: "9195195946",
            city: "Durham",
            state: "North Carolina",
            email: "albm@unc.edu"
        )

        return Included(attributes: attributes)
    }
}

struct IncludedAttributes: Codable, Hashable {
    let phone: String?
    let city: String?
    let state: String?
    let email: String?
}
