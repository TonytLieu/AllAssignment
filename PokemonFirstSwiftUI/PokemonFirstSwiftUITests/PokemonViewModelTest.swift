//
//  PokemonViewModelTest.swift
//  PokemonFirstSwiftUITests
//
//  Created by Tony Lieu on 11/12/23.
//

import XCTest
@testable import PokemonFirstSwiftUI
@MainActor
final class PokemonViewModelTest: XCTestCase {
    var pokemonListViewModel: PokemonListViewModel!
    override func setUpWithError() throws {
        //pokemonListViewModel = PokemonListViewModel()
        pokemonListViewModel = PokemonListViewModel(nM: FakeNetworkManager())
    }

    override func tearDownWithError() throws {
        pokemonListViewModel = nil
    }

    func testGetPokemonList_whenWeAreExpectingGoodResults() async throws {
        await pokemonListViewModel.getPokemonList(urlString: "PokemonList")
        XCTAssertGreaterThan(pokemonListViewModel.pokemonList.count, 0)
        let pokemon = pokemonListViewModel.pokemonList.first
        XCTAssertEqual(pokemon?.name, "Aggron")
        XCTAssertEqual(pokemonListViewModel.customError, nil)
        //XCTAssertEqual(pokemonListViewModel.pokemonList.count, 2)
    }
    func testGetPokemonList_whenWeAreExpectingEmptyURL() async throws {
        await pokemonListViewModel.getPokemonList(urlString: "")
        XCTAssertEqual(pokemonListViewModel.pokemonList.count, 0)
        XCTAssertEqual(pokemonListViewModel.customError, NetworkError.parsingError)
    }
    func testGetPokemonList_whenWeAreExpectingPassingWrongURL() async throws {
        await pokemonListViewModel.getPokemonList(urlString: "FakePokemonList")
        XCTAssertEqual(pokemonListViewModel.pokemonList.count, 0)
        XCTAssertNotNil(pokemonListViewModel.customError)
        XCTAssertEqual(pokemonListViewModel.customError, NetworkError.dataNotFound)
    }
    func testGetPokemonList_whenWeAreExpectingNoDatafound() async throws {
        await pokemonListViewModel.getPokemonList(urlString: "FakePokemonList")
        XCTAssertEqual(pokemonListViewModel.pokemonList.count, 0)
        XCTAssertNotNil(pokemonListViewModel.customError)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
