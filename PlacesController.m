//
//  PlacesController.m
//  SimpleApp
//
//  Copyright (c) 2010, SimpleGeo Inc.
//  All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "PlacesController.h"


@implementation PlacesController

- (IBAction)loadPlaces:(id)sender
{
    SGPlacesQuery *testQuery = [SGPlacesQuery queryWithPoint:[SGPoint pointWithLatitude:[latitudeField doubleValue]
                                                                              longitude:[longitudeField doubleValue]]];
    [testQuery setSearchString:[queryField stringValue]];
    [testQuery setCategories:[NSArray arrayWithObject:[categoryField stringValue]]];
    [testQuery setRadius:[radiusField floatValue]];
    [testQuery setLimit:[limitField intValue]];
    
    [[self client] getPlacesForQuery:testQuery];
}

#pragma mark SimpleGeoPlaceDelegate methods

- (void)didLoadPlaces:(SGFeatureCollection *)places
           forSGQuery:(SGPlacesQuery *)query
{
}

@end
