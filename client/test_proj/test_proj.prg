#include "inkey.ch"

REQUEST HB_CODEPAGE_UTF8
REQUEST HB_CODEPAGE_SL852
REQUEST HB_CODEPAGE_SLISO
REQUEST HB_CODEPAGE_SLWIN

MEMVAR g_cPublic1, p_cVariable

PROCEDURE Main()

   LOCAL cLoco1
   LOCAL GetList := {}

   PUBLIC g_cPublic1 := "jedan"

   p_cVariable := 1

   cLoco1 := "lokalac"

   initial_settings()
   
   CLEAR SCREEN

   AltD()
   ? "hello world", p_cVariable, Round( 2, 2 ), AllTrim( cLoco1 )

   ? "Press any key .."
   Inkey( 0 )

   CLEAR SCREEN

   @ 2, 2 SAY "Say 1" GET cLoco1
   READ

   IF LastKey() == K_ESC
      Alert( "ESC pressed!" )
      QUIT
   ENDIF

   Alert( "Value taken: " + cLoco1 )
   ? "END"
   Inkey( 0 )

   RETURN


PROCEDURE initial_settings()

   SET CENTURY OFF
   SET EPOCH TO 1980  // 81 - 1981,  79-2079
   SET DATE TO GERMAN

   Set( _SET_OSCODEPAGE, hb_cdpOS() )

   hb_cdpSelect( "SL852" )

   SET DELETED ON

   SetCancel( .F. )

   MSetCursor( .T. )
   Set( _SET_EVENTMASK, HB_INKEY_ALL )

   SET DATE GERMAN
   SET SCOREBOARD OFF
   Set( _SET_CONFIRM, .T. )
   SET WRAP ON
   SET ESCAPE ON
   SET SOFTSEEK ON
   CLEAR TYPEAHEAD

   RETURN
