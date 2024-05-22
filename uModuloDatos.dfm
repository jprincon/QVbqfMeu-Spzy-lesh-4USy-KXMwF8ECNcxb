object ModuloDatos: TModuloDatos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 341
  Width = 431
  object Conexion: TFDConnection
    Params.Strings = (
      'DriverID=MSAcc')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    Left = 24
    Top = 24
  end
  object Query: TFDQuery
    Connection = Conexion
    Left = 136
    Top = 80
  end
end
