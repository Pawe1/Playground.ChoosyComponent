unit ChoosyComponent;

interface

uses
  System.Classes;

type
  TChoosyComponent = class(TComponent)
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  System.SysUtils,
  Vcl.ExtCtrls;

resourcestring
  MsgOwnerConstraint = 'This component can only be owned by TDataModule class descendant';

constructor TChoosyComponent.Create(AOwner: TComponent);
begin
  inherited;

  if not (AOwner is TDataModule) then   // check it at the end (when everything is ready) to prevent executing destructor in uncertain circumstances
    raise Exception.Create(MsgOwnerConstraint);   //  if you raise an exception in a constructor be very careful when writing the destructor, cause you need to treat a case of improperly initialized instance.
end;

end.
