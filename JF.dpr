program JF;

uses
  Forms,
  UBase in 'UBase.pas' {FBase},
  UBaseCha in 'UBaseCha.pas' {FBaseCha},
  UBaseEdit in 'UBaseEdit.pas' {FBaseEdit},
  UBaseEditlb in 'UBaseEditlb.pas' {FBaseEditlb},
  UBaseOperation in 'UBaseOperation.pas' {FBaseOperation},
  UBaseSel in 'UBaseSel.pas' {FBaseSel},
  UCpass in 'UCpass.pas' {FCpass},
  UDM in 'UDM.pas' {DM: TDataModule},
  UGlobal in 'UGlobal.pas',
  ULogin in 'ULogin.pas' {FLogin},
  UMain in 'UMain.pas' {FMain},
  Uqxsz in 'Uqxsz.pas' {Fqxsz},
  USplash in 'USplash.pas' {FSplash},
  Uxtsz in 'Uxtsz.pas' {Fxtsz},
  UgysEdit in 'UgysEdit.pas' {FgysEdit},
  UgysEditlb in 'UgysEditlb.pas' {FgysEditlb},
  UkhEditlb in 'UkhEditlb.pas' {FkhEditlb},
  UkhEdit in 'UkhEdit.pas' {FkhEdit},
  UchflEdit in 'UchflEdit.pas' {Fchfledit},
  UcldaEditlb in 'UcldaEditlb.pas' {FcldaEditlb},
  UcldaEdit in 'UcldaEdit.pas' {FcldaEdit},
  Ucldasel in 'Ucldasel.pas' {Fcldasel},
  UewbEditlb in 'UewbEditlb.pas' {FewbEditlb},
  UewbEdit in 'UewbEdit.pas' {FewbEdit},
  Uddlr in 'Uddlr.pas' {Fddlr},
  Uewbzk in 'Uewbzk.pas' {Fewbzk},
  Ukhdasel in 'Ukhdasel.pas' {Fkhdasel},
  Ubomlr in 'Ubomlr.pas' {Fbomlr},
  Ubomlredit in 'Ubomlredit.pas' {Fbomlredit},
  UddSel in 'UddSel.pas' {FddSel},
  Ulcsz in 'Ulcsz.pas' {Flcsz},
  Umfljh in 'Umfljh.pas' {Fmfljh},
  Udhjh in 'Udhjh.pas' {Fdhjh},
  Ugysdasel in 'Ugysdasel.pas' {Fgysdasel},
  Ujdhb in 'Ujdhb.pas' {Fjdhb},
  Umflrk in 'Umflrk.pas' {Fmflrk},
  Umflly in 'Umflly.pas' {Fmflly},
  Ucylchb in 'Ucylchb.pas' {Fcylchb},
  Uwxlchb in 'Uwxlchb.pas' {Fwxlchb},
  Urkjm in 'Urkjm.pas' {Frkjm},
  Ulrjm in 'Ulrjm.pas' {Flrjm},
  Ucylchbjm in 'Ucylchbjm.pas' {Fcylchbjm},
  Uwxlchbjm in 'Uwxlchbjm.pas' {Fwxlchbjm},
  UwxdzbEditlb in 'UwxdzbEditlb.pas' {FwxdzbEditlb},
  UwxdzbEdit in 'UwxdzbEdit.pas' {FwxdzbEdit},
  Urysel in 'Urysel.pas' {Frysel},
  Ubommxedit in 'Ubommxedit.pas' {Fbommxedit},
  Ujhsclb in 'Ujhsclb.pas' {Fjhsclb},
  Ujhsc in 'Ujhsc.pas' {Fjhsc},
  Ujhhbedit in 'Ujhhbedit.pas' {Fjhhbedit},
  Ujhhblb in 'Ujhhblb.pas' {Fjhhblb},
  Ujhsel in 'Ujhsel.pas' {Fjhsel},
  UlcdaEditlb in 'UlcdaEditlb.pas' {FlcdaEditlb},
  UlcdaEdit in 'UlcdaEdit.pas' {FlcdaEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ì©¶û¼Ñ¹ÜÀíÈí¼þ¡¡V0.95';

  Application.CreateForm(TDM, DM);
  FLogin:=TFLogin.Create(Application);
  FLogin.ShowModal;
  if FLogin.ModalResult<>1 then Application.Terminate;
  FSplash:=TFSplash.Create(Application);
  FSplash.Show;
  FSplash.ReFresh;

  Application.CreateForm(TFMain, FMain);

  FSplash.Hide;
  FSplash.Close;
  FSplash.Free;
  Application.Run;
end.
