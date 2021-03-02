# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'gui.ui'
#
# Created by: PyQt5 UI code generator 5.15.2
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.

import sys
import os
import json


from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QFileDialog, QDialog, QApplication, QColorDialog
from PyQt5.uic import loadUi

class MainWindow(QtWidgets.QMainWindow):
    def __init__(self):
        super(MainWindow,self).__init__()
        loadUi('gui.ui',self)
        
        self.browseTreeModel.clicked.connect(lambda textInput=self.browseTreeModel,location='../res/models': self.browseFiles(self.treeModel,location))
        self.browseTreeShader.clicked.connect(lambda textInput=self.browseTreeShader,location='../res/shaders': self.browseFiles(self.treeShader,location))
        self.textureLocationBrowse.clicked.connect(lambda textInput=self.textureLocation,location='../res/textures': self.browseFiles(self.textureLocation,location))
        self.browseShaderLocation.clicked.connect(lambda textInput=self.shaderLocation,location='../res/shaders': self.browseFiles(self.shaderLocation,location))
        
        self.actionRun.triggered.connect(self.runConfig)
        self.runButton.clicked.connect(self.runConfig)

        self.actionSave.triggered.connect(self.saveConfig)
        self.saveButton.clicked.connect(self.runConfig)

        self.chooseFirstColor.clicked.connect(lambda : self.fillColor([self.r1,self.g1,self.b1],self.colorPreview1))
        self.chooseSecondColor.clicked.connect(lambda : self.fillColor([self.r2,self.g2,self.b2],self.colorPreview2))
        self.chooseWaterColor.clicked.connect(lambda : self.fillColor([self.wr,self.wg,self.wb],self.waterColorPreview))
        
        self.fillColorPreview([self.r1,self.g1,self.b1],self.colorPreview1)
        self.fillColorPreview([self.r2,self.g2,self.b2],self.colorPreview2)
        self.fillColorPreview([self.wr,self.wg,self.wb],self.waterColorPreview)
        self.name = ""

    def browseFiles(self,textInput,location):
        fname = QFileDialog.getOpenFileName(QDialog(),'Select file',location)
        textInput.setText(fname[0])

    def fillColor(self,outputs,preview):
        color = QColorDialog.getColor()
        col = [color.red(),color.green(),color.blue()]
        for i in range(3):
            outputs[i].setValue(col[i]/255)
        self.fillColorPreview([outputs[0],outputs[1],outputs[2]],preview)
        
    def fillColorPreview(self,inputs,output):
        col = ""
        for i in range(3):
            val = str(hex(int(inputs[i].value()*255)))[2:-1]
            if len(val) == 1:
                val += '0'
            elif len(val) == 0:
                val += '00'
            col = col + val
        output.setStyleSheet('background-color: #'+col+';')
        
    def saveConfig(self):
        name = QFileDialog.getSaveFileName(QDialog(),'Save File')
        self.name = name[0]
        file = open(name[0],"w",encoding="utf-8")
        self.writeJson(file)
       

    def runConfig(self):
        if self.name != "":
            os.system("cd .. && ./Build/main %s" % self.name)
        else:
            self.saveConfig()
            os.system("cd .. && ./Build/main %s" % self.name)


    def writeJson(self,file):
        config = {}
        perlinnoise = {}
        dimensions = {}
        colors = {}
        lighting = {}
        water = {}
        shader = {}
        matrices = {}

        perlinnoise["bias"] = self.bias.value()
        perlinnoise["octaves"] = self.octaves.value()
        perlinnoise["seed"] = self.seed.value()

        dimensions["x"] = self.x.value()
        dimensions["y"] = self.y.value()
        dimensions["max_height"] = self.maxHeight.value()
        dimensions["posX"] = self.posx.value()
        dimensions["posY"] = self.posy.value()
        dimensions["offset"] = self.offset.value()
        dimensions["collisionOffset"] = self.collisionOffset.value()
        dimensions["primitive"] = self.primitive.currentText()
        dimensions["trees"] = self.treesEnabled.isChecked()
        dimensions["grid"] = {}
        dimensions["grid"]["chancePerGrid"] = self.chanceOfTrees.value()
        dimensions["grid"]["maxNumInGrid"] = self.maxTreesInGrid.value()
        dimensions["grid"]["treeModel"] = self.treeModel.text()
        dimensions["grid"]["treeShader"] = self.treeShader.text()
        dimensions["grid"]["treeUniformBufferForProjAndView"] = self.useUniformBufferForProjectionAndView.isChecked()
        dimensions["grid"]["instancing"] = self.instancing.isChecked()
        dimensions["grid"]["gridX"] = self.gridX.value()
        dimensions["grid"]["gridY"] = self.gridY.value()

        colors["texture"] = self.textureTrue.isChecked()
        colors["textureLocation"] = self.textureLocation.text()
        colors["textureSlot"] = self.textureSlot.value()
        colors["textureRepeat"] = self.textureRepeat.isChecked()
        colors["textureRepeatConfig"] = {}
        colors["textureRepeatConfig"]["xTextureRepeatOffset"] = self.xTextureRepeatOffset.value()
        colors["textureRepeatConfig"]["yTextureRepeatOffset"] = self.yTextureRepeatOffset.value()
        colors["color1"] = [self.r1.value(),self.g1.value(),self.b1.value()]
        colors["color2"] = [self.r2.value(),self.g2.value(),self.b2.value()]

        
        config["genNormals"] = self.genNormals.isChecked()
        lighting["perFaceNormals"] = self.perFaceNormals.isChecked()

        config["waterPresent"] = self.waterPresent.isChecked()

        water["waterY"] = self.waterY.value()
        water["waterColor"] = [self.wr.value(), self.wg.value(), self.wb.value()]
        water["useFrameBuffers"] = self.useFrameBuffers.isChecked()

        shader["shaderLocation"] = self.shaderLocation.text()
        shader["textureUniformName"] = self.textureUniformName.text()
        shader["uniformBufferForProjAndView"] = self.uniformBufferForProjAndView.isChecked()
        shader["geometryShader"] = self.geometryShader.isChecked()

        matrices["model"] = [self.model1.value(),self.model2.value(),self.model3.value(),self.model4.value(),self.model5.value(),self.model6.value(),self.model7.value(),self.model8.value(),self.model9.value(),self.model10.value(),self.model11.value(),self.model12.value(),self.model13.value(),self.model14.value(),self.model15.value(),self.model16.value()]

        config["perlinnoise"] = perlinnoise
        config["dimensions"] = dimensions
        config["colors"] = colors
        config["lighting"] = lighting
        config["water"] = water
        config["shader"] = shader
        config["matrices"] = matrices

        json.dump(config,file,ensure_ascii = False)

app = QApplication([])
window = MainWindow()
window.show()
app.exec()
