//
//  Constants.swift
//  SEMproto
//
//  Created by Emyr  on 04/08/2020.
//  Copyright © 2020 Emyr . All rights reserved.
//

import Foundation

struct samplesFakeDB {
    static var sampleArray = [
        [
            ["name":"Dragonfly Wing", "mag":"16", "image":"s0z0", "scale":"3.00mm", "scsz":"1"],
            ["name":"Dragonfly Wing", "mag":"43", "image":"s0z1", "scale":"1.00mm", "scsz":"1"],
            ["name":"Dragonfly Wing", "mag":"108", "image":"s0z2", "scale":"500μm", "scsz":"1"]
        ],
        [
            ["name":"Zinc-Brittle", "mag":"22", "image":"s1z0", "scale":"2.00mm", "scsz":"1"],
            ["name":"Zinc-Brittle", "mag":"48", "image":"s1z1", "scale":"1.00mm", "scsz":"1"],
            ["name":"Zinc-Brittle", "mag":"94", "image":"s1z2", "scale":"500μm", "scsz":"1"]
        ],
        [
            ["name":"Aluminium-Ductile", "mag":"20", "image":"s2z0", "scale":"2.00mm", "scsz":"1"],
            ["name":"Aluminium-Ductile", "mag":"53", "image":"s2z1", "scale":"1.00mm", "scsz":"1"],
            ["name":"Aluminium-Ductile", "mag":"206", "image":"s2z2", "scale":"200μm", "scsz":"1"],
            ["name":"Aluminium-Ductile", "mag":"501", "image":"s2z3", "scale":"100μm", "scsz":"1"]
        ],
        [
            ["name":"CFRP-Interlaminar", "mag":"17", "image":"s3z0", "scale":"3.00mm", "scsz":"1.2"],
            ["name":"CFRP-Interlaminar", "mag":"200", "image":"s3z1", "scale":"200μm", "scsz":"1"],
            ["name":"CFRP-Interlaminar", "mag":"490", "image":"s3z2", "scale":"100μm", "scsz":"1"]
        ],
        [
            ["name":"CFRP-Translaminar", "mag":"32", "image":"s4z0", "scale":"1.00mm", "scsz":"0.8"],
            ["name":"CFRP-Translaminar", "mag":"95", "image":"s4z1", "scale":"500μm", "scsz":"1"],
            ["name":"CFRP-Translaminar", "mag":"99", "image":"s4z2", "scale":"500μm", "scsz":"1.2"],
            ["name":"CFRP-Translaminar", "mag":"299", "image":"s4z3", "scale":"100μm", "scsz":"0.8"],
            ["name":"CFRP-Translaminar", "mag":"449", "image":"s4z4", "scale":"100μm", "scsz":"1.1"]
        ],
        [
            ["name":"Welcome Guide", "mag":"n/a", "image":"SEMlogo", "scale":"n/a", "scsz":"n/a"],
        ],
        [
            ["name":"SEM Info", "mag":"n/a", "image":"SEMlogo", "scale":"n/a", "scsz":"n/a"]
        ]
    ]

}

struct samplesInfoDB {
    static var infoArray = [
        [//sample level
            [//view level
                ["name":"Dragonfly Wing", "mag":"16", "info":"delamination!", "X":"500", "Y":"305"],//info level
                ["name":"Dragonfly Wing", "mag":"16", "info":"some stuff", "X":"100", "Y":"500"]
            ],
            [
                ["name":"Dragonfly Wing", "mag":"43", "info":"How did this happen?", "X":"600", "Y":"540"]
            ],
            [
                ["name":"Dragonfly Wing", "mag":"108", "info":"Look at that", "X":"200", "Y":"400"]
            ]
        ],
        [
            [
                ["name":"Brittle", "mag":"22", "info":"Whoa", "X":"160", "Y":"400"]
            ],
            [
                ["name":"Brittle", "mag":"48", "info":"cool", "X":"700", "Y":"500"]
            ],
            [
                ["name":"Brittle", "mag":"94", "info":"check it out", "X":"180", "Y":"100"],
                ["name":"Brittle", "mag":"94", "info":"It broke somehow", "X":"800", "Y":"400"]
            ]
        ],
        [
            [
                ["name":"Ductile", "mag":"20", "info":"more info", "X":"800", "Y":"300"]
            ],
            [
                ["name":"Ductile", "mag":"53", "info":"interactive", "X":"400", "Y":"600"]
            ],
            [
                ["name":"Ductile", "mag":"206", "info":"materials", "X":"600", "Y":"900"],
                ["name":"Ductile", "mag":"206", "info":"so mental", "X":"900", "Y":"500"]
            ],
            [
                ["name":"Ductile", "mag":"501", "info":"write whatever you want", "X":"700", "Y":"700"]
            ]
        ],
        [
            [
                ["name":"Inter", "mag":"17", "info":"This was hard to code", "X":"800", "Y":"400"],
                ["name":"Inter", "mag":"17", "info":"Some stuff about toughness", "X":"400", "Y":"900"]
            ],
            [
                ["name":"Inter", "mag":"200", "info":"strain energy", "X":"500", "Y":"900"]
            ],
            [
                ["name":"Inter", "mag":"490", "info":"merit index something", "X":"800", "Y":"1000"]
            ]
        ],
        [
            [
                ["name":"Trans", "mag":"32", "info":"Which direction was the load", "X":"800", "Y":"400"]
            ],
            [
                ["name":"Trans", "mag":"95", "info":"difference between BCC and FCC?", "X":"800", "Y":"600"]
            ],
            [
                ["name":"Trans", "mag":"99", "info":"Swift is a cool programming language", "X":"1100", "Y":"700"],
                ["name":"Trans", "mag":"99", "info":"I've broken my arm 7 times :(", "X":"800", "Y":"400"]
            ],
            [
                ["name":"Trans", "mag":"299", "info":"Yield stress of 2", "X":"800", "Y":"900"]
            ],
            [
                ["name":"Trans", "mag":"449", "info":"What's the composition of the eutectoid?", "X":"900", "Y":"600"]
            ]
        ]
    ]

    
}
