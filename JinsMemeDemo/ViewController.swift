//
//  ViewController.swift
//  JinsMemeDemo
//
//  Created by matz on 2015/11/21.
//  Copyright © 2015年 matz. All rights reserved.
//

import UIKit

final class ViewController: UITableViewController, MEMELibDelegate {

    var peripherals:NSMutableArray!
    var dataViewCtl:MMDataViewController!
    var detailViewCtl:MMDataDetaileViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MEMELib.sharedInstance().delegate = self
        self.peripherals = []
        self.title = "MEME Demo"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Scan", style: UIBarButtonItemStyle.plain, target: self, action: #selector(scanButtonPressed))
    }
    
    func scanButtonPressed(){
        let status:MEMEStatus = MEMELib.sharedInstance().startScanningPeripherals()
        self.checkMEMEStatus(status)
    }
    
    func memePeripheralFound(_ peripheral: CBPeripheral!, withDeviceAddress address: String!) {
        
        print("New Peripheral found \(peripheral.identifier.uuidString) \(address)")
        self.peripherals.add(peripheral)
        self.tableView.reloadData()
    }
    
    func memePeripheralConnected(_ peripheral: CBPeripheral!) {
        
        print("MEME Device Connected")
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        self.tableView.isUserInteractionEnabled = false
        self.performSegue(withIdentifier: "DataViewSegue", sender: self)

        // Set Data Mode to Standard Mode
        MEMELib.sharedInstance().startDataReport()
    }
    
    func memePeripheralDisconnected(_ peripheral: CBPeripheral!) {
        
        print("MEME Device Disconnected")
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        self.tableView.isUserInteractionEnabled = true
        self.dismiss(animated: true) { () -> Void in
            self.dataViewCtl = nil
            print("MEME Device Disconnected")
        }
    }
    
    func memeRealTimeModeDataReceived(_ data: MEMERealTimeData!) {
        guard let _ = self.dataViewCtl else { return }
        self.dataViewCtl.memeRealTimeModeDataReceived(data)
        RealtimeData.sharedInstance.memeRealTimeModeDataReceived(data)
    }
    
    func memeAppAuthorized(_ status: MEMEStatus) {
        self.checkMEMEStatus(status)
    }
    
    
    func memeCommand(_ response: MEMEResponse) {
        
        print("Command Response - eventCode: \(response.eventCode) - commandResult: \(response.commandResult)")
        
        switch (response.eventCode) {
        case 0x02:
            print("Data Report Started");
            break;
        case 0x04:
            print("Data Report Stopped");
            break;
        default:
            break;
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.peripherals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCellIdentifier", for: indexPath)
        let peripheral:CBPeripheral = self.peripherals.object(at: indexPath.row) as! CBPeripheral
        cell.textLabel?.text = peripheral.identifier.uuidString
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let peripheral:CBPeripheral = self.peripherals.object(at: indexPath.row) as! CBPeripheral
        let status:MEMEStatus = MEMELib.sharedInstance().connect(peripheral)
        self.checkMEMEStatus(status)
        
        print("Start connecting to MEME Device...")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DataViewSegue" {
            
            let naviCtl = segue.destination as! UINavigationController
            self.dataViewCtl = naviCtl.topViewController as! MMDataViewController
        }
    }

    
    func checkMEMEStatus(_ status:MEMEStatus) {
        
        if status == MEME_ERROR_APP_AUTH {
            let alertController = UIAlertController(title: "App Auth Failed", message: "Invalid Application ID or Client Secret ", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler:nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        } else if status == MEME_ERROR_SDK_AUTH{
            let alertController = UIAlertController(title: "SDK Auth Failed", message: "Invalid SDK. Please update to the latest SDK.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler:nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        } else if status == MEME_CMD_INVALID {
            let alertController = UIAlertController(title: "SDK Error", message: "Invalid Command", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler:nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        } else if status == MEME_ERROR_BL_OFF {
            let alertController = UIAlertController(title: "Error", message: "Bluetooth is off.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler:nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        } else if status == MEME_OK {
            print("Status: MEME_OK")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

