//
//  ApiCredentials.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

import UAObfuscatedString

class ApiCredentials {

    // For security reasons, apiKey and apiUrl are obfuscated
    static var apiURL: String = "".h.t.t.p.s.colon.forward_slash.forward_slash.a.p.i.dot.t.h.e.m.o.v.i.e.d.b.dot.o.r.g.forward_slash._3
    // 022375c127f75f4fdfcd8943d32ee0e8 my account key
    static var apiKey: String =
            ""._0._2._2._3._7._5.c._1._2._7.f._7._5.f._4.f.d.f.c.d._8._9._4._3.d._3._2.e.e._0.e._8
    
    static let imdbUrl = "https://m.imdb.com/title/"
    
    
    // "To build an image URL, you will need 3 pieces of data. The base_url, size and file_path"
    // https://developers.themoviedb.org/3/configuration/get-api-configuration
    static var imageBaseUrl: String? = nil
    static var imageBackdropSize: String? = nil
    static var imageLogoSize: String? = nil
    static var imagePosterSize: String? = nil
    static var imageProfileSize: String? = nil
    static var imageStillSize: String? = nil
}
