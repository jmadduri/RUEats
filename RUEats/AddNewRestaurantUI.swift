//
//  AddNewRestaurantUI.swift
//  RUEats
//
//  Created by William Wu on 4/6/22.
//
import MapKit
import SwiftUI

struct AddNewRestaurantUI: View {
    @State var  RestaurantName = ""
    @State var  RestaurantState = ""
    @State var RestaurantAddress = ""
    @State var RestaurantCity = ""
    @State var RestaurantPostalCode = ""
    @State var WillReccomend = false
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.522195, longitude: -74.462334), span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
    
    var body: some View {
        NavigationView{
            VStack {
                //Spacer()
                Form{
                    // Will just help to better organize
                    Section(header: Text("Please enter a valid name")) {            TextField("Restaurant Name", text: $RestaurantName)
                    }
                    Section(header: Text("Restaurant Information")) {
                        TextField("Street Address", text: $RestaurantAddress)
                        TextField("City", text: $RestaurantCity)
                        TextField("State", text: $RestaurantState)
                        TextField("Postal Code", text: $RestaurantPostalCode)
                        Toggle("Would you reccomend?", isOn: $WillReccomend)
                    }
                    Section {
//                        Map(coordinateRegion: $region)
//                            .frame(width: 500, height: 350)
                    }
                }
                .toolbar {
                    NavigationLink(destination: maps(), label: {Image(systemName: "map")})
                }
            }
            .navigationTitle("Add New Restaurant")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    
                }
            }
        }
    }
}

struct maps: View {
    @State var mapView = MapViewModel()
    
    var body : some View {
        Map(coordinateRegion: $mapView.region, showsUserLocation: true)
            .ignoresSafeArea()
            .onAppear() {
                mapView.isLocationServiceEnabled()
            }
    }
}

struct AddNewRestaurantUI_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRestaurantUI()
            .preferredColorScheme(.dark)
    }
}

func saveUser() {
    print("saved")
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.522195, longitude: -74.462334), span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08))
    
    var locationManager: CLLocationManager?
    
    func isLocationServiceEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager?.delegate = self
        } else {
            // Ask for location
        }
        
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("You have restricted location settings. To change this go to location services within the setting app")
        case .denied:
            print("YOU NO GET LOCATION OGABOGA")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
