//
//  CollectionsUICollectionViewAdapterTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import XCTest
@testable import Recipe

class CollectionsUICollectionViewAdapterTests: XCTestCase {

    func testNumberOfItemsInSectionWhenEmpty() {
        let collectionView = getDummyCollectionView()
        let sut = CollectionsUICollectionViewAdapter(collectionView: collectionView)
        sut.reloadData(with: [])

        let numberOfItems = sut.collectionView(collectionView, numberOfItemsInSection: 0)

        XCTAssertEqual(numberOfItems, 0)
    }

    func testNumberOfItemsInSectionWithData() {
        let mock = CollectionsUIModel.mock()
        let collectionView = getDummyCollectionView()
        let sut = CollectionsUICollectionViewAdapter(collectionView: collectionView, dataSource: mock)

        let numberOfItems = sut.collectionView(collectionView, numberOfItemsInSection: 0)

        XCTAssertEqual(numberOfItems, 1)
    }

    func testCellForRowAtCellConfiguration() {
        let mock = CollectionsUIModel.mock()
        let collectionView = getDummyCollectionView()
        let sut = CollectionsUICollectionViewAdapter(collectionView: collectionView, dataSource: mock)

        if let cell = sut.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) as? TitleAndImageCollectionViewCell {
            XCTAssertEqual(cell.titleLabel.text, mock.first!.title)
            return
        }
        XCTFail("failed in \(#function)")
    }

    func getDummyCollectionView() -> UICollectionView {
        return UICollectionView(frame: UIScreen.main.bounds,
                                collectionViewLayout: UICollectionViewFlowLayout())
    }
}

fileprivate extension CollectionsUIModel {
    static func mock() -> [Self] {
        return [CollectionsUIModel(id: Identifier<CollectionIdentifier>(id: 1),
                                   title: "First",
                                   coverImageURL: URL(string: "cookpad.github.io")!)]
    }
}
