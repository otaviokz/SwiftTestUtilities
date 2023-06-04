import XCTest
@testable import TestUtilities

final class TestUtilitiesTests: XCTestCase {
    func testEGroceries() throws {
        // Given:
        let groceryItems: [DecodableListItem] = try JsonLoader.loadJson("Groceries", bundle: Bundle(for: Self.self))
        
        // Then:
        XCTAssertEqual(groceryItems.count, 5)
        
        let first = groceryItems[0]
        XCTAssertEqual(first.name, "Carrots")
        XCTAssertEqual(first.notes, "Big Ones")
        XCTAssertEqual(first.quantity, 6)
        XCTAssertEqual(first.list, "Groceries")
        
        let second = groceryItems[1]
        XCTAssertEqual(second.name, "Lettuce")
        XCTAssertNil(second.notes)
        XCTAssertEqual(second.quantity, 1)
        XCTAssertEqual(second.list, "Groceries")
        
        let third = groceryItems[2]
        XCTAssertEqual(third.name, "Minced Meat")
        XCTAssertEqual(third.notes, "3 pounds")
        XCTAssertNil(third.quantity)
        XCTAssertEqual(third.list, "Groceries")
        
        let forth = groceryItems[3]
        XCTAssertEqual(forth.name, "Potatoes")
        XCTAssertNil(forth.notes)
        XCTAssertEqual(forth.quantity, 5)
        XCTAssertEqual(forth.list, "Groceries")
        
        let fifth = groceryItems[0]
        XCTAssertEqual(fifth.name, "Tomatoes")
        XCTAssertEqual(fifth.notes, "Half a kilo, Preferably the Spanish ones")
        XCTAssertNil(fifth.quantity)
        XCTAssertEqual(fifth.list, "Groceries")
    }
    
    
}

struct DecodableListItem: Decodable {
    let name: String
    let notes: String?
    let quantity: Int?
    let list: String
}
