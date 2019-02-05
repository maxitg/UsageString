(* ::Package:: *)

(* ::Title:: *)
(*UsageString*)


(* ::Text:: *)
(*See on GitHub: https://github.com/maxitg/WLUsageString.*)


BeginPackage["UsageString`"];


Unprotect @ UsageString;


Begin["`Private`"];


$ArgStyle[arg_Integer] := "TR";
$ArgStyle["\[Ellipsis]"] := "TR";
$ArgStyle[str_String] := "TI";


$ArgString[arg_] :=
	"\!\(\*StyleBox[\"" <> ToString[arg] <> "\", \"" <> $ArgStyle[arg] <> "\"]\)"


UsageString[str__] :=
	(StringTemplate[StringJoin[{str}]] /. {TemplateSlot[s_] :> $ArgString[s]})[]


UsageString::usage = UsageString[
	"UsageString[\!\(\*SubscriptBox[\(`s`\), \(`1`\)]\), ",
	"\!\(\*SubscriptBox[\(`s`\), \(`2`\)]\), `\[Ellipsis]`] yields a usage string where ",
	"\!\(\*SubscriptBox[\(`s`\), \(`i`\)]\) are concatenated and slots enclosed by `",
	" are rendered in italic similar to official Wolfram Language documentation."
];


End[];


Protect @ UsageString;


EndPackage[];
