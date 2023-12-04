import nre
import random
import strutils
import word

let O_TO_OWO* = re"o"
let EW_TO_UWU* = re"ew"
let HEY_TO_HAY* = re"([Hh])ey"
let DEAD_TO_DED_UPPER* = re"Dead"
let DEAD_TO_DED_LOWER* = re"dead"
let N_VOWEL_T_TO_ND* = re"n[aeiou]*t"
let READ_TO_WEAD_UPPER* = re"Read"
let READ_TO_WEAD_LOWER* = re"read"
let BRACKETS_TO_STARTRAILS_FORE* = re"[({<]"
let BRACKETS_TO_STARTRAILS_REAR* = re"[)}>]"
let PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_FIRST* = re"[.,](?![0-9])"
let PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_SECOND* = re"[!;]+"
let THAT_TO_DAT_UPPER* = re"That"
let THAT_TO_DAT_LOWER* = re"that"
let TH_TO_F_UPPER* = re"TH(?!E)"
let TH_TO_F_LOWER* = re"[Tt]h(?![Ee])"
let LE_TO_WAL* = re"le$"
let VE_TO_WE_UPPER* = re"Ve"
let VE_TO_WE_LOWER* = re"ve"
let RY_TO_WWY* = re"ry"
let RORL_TO_W_UPPER* = re"(?:R|L)"
let RORL_TO_W_LOWER* = re"(?:r|l)"
let LL_TO_WW* = re"ll"
let VOWEL_OR_R_EXCEPT_O_L_TO_WL_UPPER* = re"[AEIUR]([lL])$"
let VOWEL_OR_R_EXCEPT_O_L_TO_WL_LOWER* = re"[aeiur]l$"
let OLD_TO_OWLD_UPPER* = re"OLD"
let OLD_TO_OWLD_LOWER* = re"([Oo])ld"
let OL_TO_OWL_UPPER* = re"OL"
let OL_TO_OWL_LOWER* = re"([Oo])l"
let LORR_O_TO_WO_UPPER* = re"[LR]([oO])"
let LORR_O_TO_WO_LOWER* = re"[lr]o"
let SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_UPPER* = re"([BCDFGHJKMNPQSTXYZ])([oO])"
let SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_LOWER* = re"([bcdfghjkmnpqstxyz])o"
let VORW_LE_TO_WAL* = re"[vw]le"
let FI_TO_FWI_UPPER* = re"FI"
let FI_TO_FWI_LOWER* = re"([Ff])i"
let VER_TO_WER* = re"([Vv])er"
let POI_TO_PWOI* = re"([Pp])oi"
let SPECIFIC_CONSONANTS_LE_TO_LETTER_AND_WAL* = re"([DdFfGgHhJjPpQqRrSsTtXxYyZz])le$"
let CONSONANT_R_TO_CONSONANT_W* = re"([BbCcDdFfGgKkPpQqSsTtWwXxZz])r"
let LY_TO_WY_UPPER* = re"Ly"
let LY_TO_WY_LOWER* = re"ly"
let PLE_TO_PWE* = re"([Pp])le"
let NR_TO_NW_UPPER* = re"NR"
let NR_TO_NW_LOWER* = re"([Nn])r"
let MEM_TO_MWEM_UPPER* = re"Mem"
let MEM_TO_MWEM_LOWER* = re"mem"
let NYWO_TO_NYO* = re"([Nn])ywo"
let FUC_TO_FWUC* = re"([Ff])uc"
let MOM_TO_MWOM* = re"([Mm])om"
let ME_TO_MWE_UPPER* = re"^Me$"
let ME_TO_MWE_LOWER* = re"^me$"
let N_VOWEL_TO_NY_FIRST* = re"n([aeiou])"
let N_VOWEL_TO_NY_SECOND* = re"N([aeiou])"
let N_VOWEL_TO_NY_THIRD* = re"N([AEIOU])"
let OVE_TO_UV_UPPER* = re"OVE"
let OVE_TO_UV_LOWER* = re"ove"
let HAHA_TO_HEHE_XD* = re"\b(ha|hah|heh|hehe)+\b"
let THE_TO_TEH* = re"\b([Tt])he\b"
let YOU_TO_U_UPPER* = re"\bYou\b"
let YOU_TO_U_LOWER* = re"\byou\b"
let TIME_TO_TIM* = re"\b([Tt])ime\b"
let OVER_TO_OWOR* = re"([Oo])ver"
let WORSE_TO_WOSE* = re"([Ww])orse"
let GREAT_TO_GWATE* = re"([Gg])reat"
let AVIAT_TO_AWIAT* = re"([Aa])viat"
let DEDICAT_TO_DEDITAT* = re"([Dd])edicat"
let REMEMBER_TO_REMBER* = re"([Rr])emember"
let WHEN_TO_WEN* = re"([Ww])hen"
let FRIGHTENED_TO_FRIGTEN* = re"([Ff])righten(ed)*"
let MEME_TO_MEM_FIRST* = re"Meme"
let MEME_TO_MEM_SECOND* = re"Mem"
let FEEL_TO_FELL* = re"^([Ff])eel$"

let FACES = [
    "(・`ω´・)", ";;w;;", "owo", "UwU", ">w<", "^w^", "(* ^ ω ^)",
    "(⌒ω⌒)", "ヽ(*・ω・)ﾉ", "(o´∀`o)", "(o･ω･o)", "＼(＾▽＾)／",
    "(*^ω^)", "(◕‿◕✿)", "(◕ᴥ◕)", "ʕ•ᴥ•ʔ", "ʕ￫ᴥ￩ʔ", "(*^.^*)", "(｡♥‿♥｡)",
    "OwO", "uwu", "uvu", "UvU", "(*￣з￣)", "(つ✧ω✧)つ", "(/ =ω=)/",
    "(╯°□°）╯︵ ┻━┻", "┬─┬ ノ( ゜-゜ノ)", "¯\\_(ツ)_/¯"
]

proc mapOToOwO*(input: var Word) =
    var replacement = ""
    if rand(1) > 0:
        replacement = "owo"
    else:
        replacement = "o"
    input.replace(O_TO_OWO, replacement)


proc mapEwToUwU*(input: var Word) =
    input.replace(EW_TO_UWU, "uwu")


proc mapHeyToHay*(input: var Word) =
    input.replace(HEY_TO_HAY, "$1ay")


proc mapDeadToDed*(input: var Word) =
    input.replace(DEAD_TO_DED_UPPER, "Ded")
    input.replace(DEAD_TO_DED_LOWER, "ded")


proc mapNVowelTToNd*(input: var Word) =
    input.replace(N_VOWEL_T_TO_ND, "nd")


proc mapReadToWead*(input: var Word) =
    input.replace(READ_TO_WEAD_UPPER, "Wead")
    input.replace(READ_TO_WEAD_LOWER, "wead")


proc mapBracketsToStarTrails*(input: var Word) =
    input.replace(BRACKETS_TO_STARTRAILS_FORE, "｡･:*:･ﾟ★,｡･:*:･ﾟ☆")
    input.replace(BRACKETS_TO_STARTRAILS_REAR, "☆ﾟ･:*:･｡,★ﾟ･:*:･｡")


proc mapPeriodCommaExclamationSemicolonToKaomojis*(input: var Word) =
    input.replaceWithProcSingle(PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_FIRST, proc(): string = FACES[rand(FACES.len() - 1)])
    input.replaceWithProcSingle(PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_SECOND, proc(): string = FACES[rand(FACES.len() - 1)])


proc mapThatToDat*(input: var Word) =
    input.replace(THAT_TO_DAT_LOWER, "dat")
    input.replace(THAT_TO_DAT_UPPER, "Dat")


proc mapThToF*(input: var Word) =
    input.replace(TH_TO_F_LOWER, "f")
    input.replace(TH_TO_F_UPPER, "F")


proc mapLeToWal*(input: var Word) =
    input.replace(LE_TO_WAL, "wal")


proc mapVeToWe*(input: var Word) =
    input.replace(VE_TO_WE_LOWER, "we")
    input.replace(VE_TO_WE_UPPER, "We")


proc mapRyToWwy*(input: var Word) =
    input.replace(RY_TO_WWY, "wwy")


proc mapROrLToW*(input: var Word) =
    input.replace(RORL_TO_W_LOWER, "w")
    input.replace(RORL_TO_W_UPPER, "W")


proc mapLlToWw*(input: var Word) =
    input.replace(LL_TO_WW, "ww")


proc mapVowelOrRExceptOLToWl*(input: var Word) =
    input.replace(VOWEL_OR_R_EXCEPT_O_L_TO_WL_LOWER, "wl")
    input.replace(VOWEL_OR_R_EXCEPT_O_L_TO_WL_UPPER, "W$1")


proc mapOldToOwld*(input: var Word) =
    input.replace(OLD_TO_OWLD_LOWER, "$1wld")
    input.replace(OLD_TO_OWLD_UPPER, "OWLD")


proc mapOlToOwl*(input: var Word) =
    input.replace(OL_TO_OWL_LOWER, "$1wl")
    input.replace(OL_TO_OWL_UPPER, "OWL")


proc mapLOrROToWo*(input: var Word) =
    input.replace(LORR_O_TO_WO_LOWER, "wo")
    input.replace(LORR_O_TO_WO_UPPER, "W$1")

proc mapSpecificConsonantsOToLetterAndWo*(input: var Word) =
    input.replace(SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_LOWER, "$1wo")
    input.replaceWithProcMultiple(SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_UPPER, proc(s1: string, s2: string): string =
        var msg = s1
        if s2.toUpper() == s2:
            msg &= "W"
        else:
            msg &= "w"
        msg &= s2
        msg)


proc mapVOrWLeToWal*(input: var Word) =
    input.replace(VORW_LE_TO_WAL, "wal")


proc mapFiToFwi*(input: var Word) =
    input.replace(FI_TO_FWI_LOWER, "$1wi")
    input.replace(FI_TO_FWI_UPPER, "FWI")


proc mapVerToWer*(input: var Word) =
    input.replace(VER_TO_WER, "wer")


proc mapPoiToPwoi*(input: var Word) =
    input.replace(POI_TO_PWOI, "$1woi")


proc mapSpecificConsonantsLeToLetterAndWal*(input: var Word) =
    input.replace(SPECIFIC_CONSONANTS_LE_TO_LETTER_AND_WAL, "$1wal")


proc mapConsonantRToConsonantW*(input: var Word) =
    input.replace(CONSONANT_R_TO_CONSONANT_W, "$1w")


proc mapLyToWy*(input: var Word) =
    input.replace(LY_TO_WY_LOWER, "wy")
    input.replace(LY_TO_WY_UPPER, "Wy")


proc mapPleToPwe*(input: var Word) =
    input.replace(PLE_TO_PWE, "$1we")


proc mapNrToNw*(input: var Word) =
    input.replace(NR_TO_NW_LOWER, "$1w")
    input.replace(NR_TO_NW_UPPER, "NW")


proc mapMemToMwem*(input: var Word) =
    input.replace(MEM_TO_MWEM_UPPER, "mwem")
    input.replace(MEM_TO_MWEM_LOWER, "Mwem")


proc unmapNywoToNyo*(input: var Word) =
    input.replace(NYWO_TO_NYO, "$1yo")


proc mapFucToFwuc*(input: var Word) =
    input.replace(FUC_TO_FWUC, "$1wuc")


proc mapMomToMwom*(input: var Word) =
    input.replace(MOM_TO_MWOM, "$1wom")


proc mapMeToMwe*(input: var Word) =
    input.replace(ME_TO_MWE_UPPER, "Mwe")
    input.replace(ME_TO_MWE_LOWER, "mwe")


proc mapNVowelToNy*(input: var Word) =
    input.replace(N_VOWEL_TO_NY_FIRST, "ny$1")
    input.replace(N_VOWEL_TO_NY_SECOND, "Ny$1")
    input.replace(N_VOWEL_TO_NY_THIRD, "NY$1")


proc mapOveToUv*(input: var Word) =
    input.replace(OVE_TO_UV_LOWER, "uv")
    input.replace(OVE_TO_UV_UPPER, "UV")


proc mapHahaToHeheXd*(input: var Word) =
    input.replace(HAHA_TO_HEHE_XD, "hehe xD")


proc mapTheToTeh*(input: var Word) =
    input.replace(THE_TO_TEH, "$1eh")


proc mapYouToU*(input: var Word) =
    input.replace(YOU_TO_U_UPPER, "U")
    input.replace(YOU_TO_U_LOWER, "u")


proc mapTimeToTim*(input: var Word) =
    input.replace(TIME_TO_TIM, "$1im")


proc mapOverToOwor*(input: var Word) =
    input.replace(OVER_TO_OWOR, "$1wor")


proc mapWorseToWose*(input: var Word) =
    input.replace(WORSE_TO_WOSE, "$1ose")


proc mapGreatToGwate*(input: var Word) =
    input.replace(GREAT_TO_GWATE, "$1wate")


proc mapAviatToAwiat*(input: var Word) =
    input.replace(AVIAT_TO_AWIAT, "$1wiat")


proc mapDedicatToDeditat*(input: var Word) =
    input.replace(DEDICAT_TO_DEDITAT, "$1editat")


proc mapRememberToRember*(input: var Word) =
    input.replace(REMEMBER_TO_REMBER, "$1ember")


proc mapWhenToWen*(input: var Word) =
    input.replace(WHEN_TO_WEN, "$1en")


proc mapFrightenedToFrigten*(input: var Word) =
    input.replace(FRIGHTENED_TO_FRIGTEN, "$1rigten")


proc mapMemeToMem*(input: var Word) =
    input.replace(MEME_TO_MEM_FIRST, "mem")
    input.replace(MEME_TO_MEM_SECOND, "Mem")


proc mapFeelToFell*(input: var Word) =
    input.replace(FEEL_TO_FELL, "$1ell")
