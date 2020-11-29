//
//  ErrorHandler.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation

struct ErrorHandler {
    static let generalError = "Ha ocurrido un error"
    
    static let errorCode = ["200": "OK",
                            "400": "Error de peticion", //Bad Request
                            "401": "UnAuthorized", //UnAuthorized
                            "403": "Forbidden",
                            "404": "Not Found",
                            "500": "Algo salió mal", //"Something went wrong"
                            "503": "Something went wrong"]
}
