module kalyna_inv_sbox_3_alt6_fom (s1_sbox_in, s2_sbox_in, s1_sbox_out, s2_sbox_out); 

input [7:0] s1_sbox_in, s2_sbox_in; 
output [7:0] s1_sbox_out, s2_sbox_out; 

wire [7:0] s1_sbox_in, s2_sbox_in; 
wire [7:0] s1_sbox_out, s2_sbox_out; 
wire s1_n_0, s2_n_0; 
wire s1_n_1, s2_n_1; 
wire s1_n_2, s2_n_2; 
wire s1_n_3, s2_n_3; 
wire s1_n_4, s2_n_4; 
wire s1_n_5, s2_n_5; 
wire s1_n_6, s2_n_6; 
wire s1_n_7, s2_n_7; 
wire s1_n_8, s2_n_8; 
wire s1_n_9, s2_n_9; 
wire s1_n_10, s2_n_10; 
wire s1_n_11, s2_n_11; 
wire s1_n_12, s2_n_12; 
wire s1_n_13, s2_n_13; 
wire s1_n_14, s2_n_14; 
wire s1_n_15, s2_n_15; 
wire s1_n_16, s2_n_16; 
wire s1_n_17, s2_n_17; 
wire s1_n_18, s2_n_18; 
wire s1_n_19, s2_n_19; 
wire s1_n_20, s2_n_20; 
wire s1_n_21, s2_n_21; 
wire s1_n_22, s2_n_22; 
wire s1_n_23, s2_n_23; 
wire s1_n_24, s2_n_24; 
wire s1_n_25, s2_n_25; 
wire s1_n_26, s2_n_26; 
wire s1_n_27, s2_n_27; 
wire s1_n_28, s2_n_28; 
wire s1_n_29, s2_n_29; 
wire s1_n_30, s2_n_30; 
wire s1_n_31, s2_n_31; 
wire s1_n_32, s2_n_32; 
wire s1_n_33, s2_n_33; 
wire s1_n_34, s2_n_34; 
wire s1_n_35, s2_n_35; 
wire s1_n_36, s2_n_36; 
wire s1_n_37, s2_n_37; 
wire s1_n_38, s2_n_38; 
wire s1_n_39, s2_n_39; 
wire s1_n_40, s2_n_40; 
wire s1_n_41, s2_n_41; 
wire s1_n_42, s2_n_42; 
wire s1_n_43, s2_n_43; 
wire s1_n_44, s2_n_44; 
wire s1_n_45, s2_n_45; 
wire s1_n_46, s2_n_46; 
wire s1_n_47, s2_n_47; 
wire s1_n_48, s2_n_48; 
wire s1_n_49, s2_n_49; 
wire s1_n_50, s2_n_50; 
wire s1_n_51, s2_n_51; 
wire s1_n_52, s2_n_52; 
wire s1_n_53, s2_n_53; 
wire s1_n_54, s2_n_54; 
wire s1_n_55, s2_n_55; 
wire s1_n_56, s2_n_56; 
wire s1_n_57, s2_n_57; 
wire s1_n_58, s2_n_58; 
wire s1_n_59, s2_n_59; 
wire s1_n_60, s2_n_60; 
wire s1_n_61, s2_n_61; 
wire s1_n_62, s2_n_62; 
wire s1_n_63, s2_n_63; 
wire s1_n_64, s2_n_64; 
wire s1_n_65, s2_n_65; 
wire s1_n_66, s2_n_66; 
wire s1_n_67, s2_n_67; 
wire s1_n_68, s2_n_68; 
wire s1_n_69, s2_n_69; 
wire s1_n_70, s2_n_70; 
wire s1_n_71, s2_n_71; 
wire s1_n_72, s2_n_72; 
wire s1_n_73, s2_n_73; 
wire s1_n_74, s2_n_74; 
wire s1_n_75, s2_n_75; 
wire s1_n_76, s2_n_76; 
wire s1_n_77, s2_n_77; 
wire s1_n_78, s2_n_78; 
wire s1_n_79, s2_n_79; 
wire s1_n_80, s2_n_80; 
wire s1_n_81, s2_n_81; 
wire s1_n_82, s2_n_82; 
wire s1_n_83, s2_n_83; 
wire s1_n_84, s2_n_84; 
wire s1_n_85, s2_n_85; 
wire s1_n_86, s2_n_86; 
wire s1_n_87, s2_n_87; 
wire s1_n_88, s2_n_88; 
wire s1_n_89, s2_n_89; 
wire s1_n_90, s2_n_90; 
wire s1_n_91, s2_n_91; 
wire s1_n_92, s2_n_92; 
wire s1_n_93, s2_n_93; 
wire s1_n_94, s2_n_94; 
wire s1_n_95, s2_n_95; 
wire s1_n_96, s2_n_96; 
wire s1_n_97, s2_n_97; 
wire s1_n_98, s2_n_98; 
wire s1_n_99, s2_n_99; 
wire s1_n_100, s2_n_100; 
wire s1_n_101, s2_n_101; 
wire s1_n_102, s2_n_102; 
wire s1_n_103, s2_n_103; 
wire s1_n_104, s2_n_104; 
wire s1_n_105, s2_n_105; 
wire s1_n_106, s2_n_106; 
wire s1_n_107, s2_n_107; 
wire s1_n_108, s2_n_108; 
wire s1_n_109, s2_n_109; 
wire s1_n_110, s2_n_110; 
wire s1_n_111, s2_n_111; 
wire s1_n_112, s2_n_112; 
wire s1_n_113, s2_n_113; 
wire s1_n_114, s2_n_114; 
wire s1_n_115, s2_n_115; 
wire s1_n_116, s2_n_116; 
wire s1_n_117, s2_n_117; 
wire s1_n_118, s2_n_118; 
wire s1_n_119, s2_n_119; 
wire s1_n_120, s2_n_120; 
wire s1_n_121, s2_n_121; 
wire s1_n_122, s2_n_122; 
wire s1_n_123, s2_n_123; 
wire s1_n_124, s2_n_124; 
wire s1_n_125, s2_n_125; 
wire s1_n_126, s2_n_126; 
wire s1_n_127, s2_n_127; 
wire s1_n_128, s2_n_128; 
wire s1_n_129, s2_n_129; 
wire s1_n_130, s2_n_130; 
wire s1_n_131, s2_n_131; 
wire s1_n_132, s2_n_132; 
wire s1_n_133, s2_n_133; 
wire s1_n_134, s2_n_134; 
wire s1_n_135, s2_n_135; 
wire s1_n_136, s2_n_136; 
wire s1_n_137, s2_n_137; 
wire s1_n_138, s2_n_138; 
wire s1_n_139, s2_n_139; 
wire s1_n_140, s2_n_140; 
wire s1_n_141, s2_n_141; 
wire s1_n_142, s2_n_142; 
wire s1_n_143, s2_n_143; 
wire s1_n_144, s2_n_144; 
wire s1_n_145, s2_n_145; 
wire s1_n_146, s2_n_146; 
wire s1_n_147, s2_n_147; 
wire s1_n_148, s2_n_148; 
wire s1_n_149, s2_n_149; 
wire s1_n_150, s2_n_150; 
wire s1_n_151, s2_n_151; 
wire s1_n_152, s2_n_152; 
wire s1_n_153, s2_n_153; 
wire s1_n_154, s2_n_154; 
wire s1_n_155, s2_n_155; 
wire s1_n_156, s2_n_156; 
wire s1_n_157, s2_n_157; 
wire s1_n_158, s2_n_158; 
wire s1_n_159, s2_n_159; 
wire s1_n_160, s2_n_160; 
wire s1_n_161, s2_n_161; 
wire s1_n_162, s2_n_162; 
wire s1_n_163, s2_n_163; 
wire s1_n_164, s2_n_164; 
wire s1_n_165, s2_n_165; 
wire s1_n_166, s2_n_166; 
wire s1_n_167, s2_n_167; 
wire s1_n_168, s2_n_168; 
wire s1_n_169, s2_n_169; 
wire s1_n_170, s2_n_170; 
wire s1_n_171, s2_n_171; 
wire s1_n_172, s2_n_172; 
wire s1_n_173, s2_n_173; 
wire s1_n_174, s2_n_174; 
wire s1_n_175, s2_n_175; 
wire s1_n_176, s2_n_176; 
wire s1_n_177, s2_n_177; 
wire s1_n_178, s2_n_178; 
wire s1_n_179, s2_n_179; 
wire s1_n_180, s2_n_180; 
wire s1_n_181, s2_n_181; 
wire s1_n_182, s2_n_182; 
wire s1_n_183, s2_n_183; 
wire s1_n_184, s2_n_184; 
wire s1_n_185, s2_n_185; 
wire s1_n_186, s2_n_186; 
wire s1_n_187, s2_n_187; 
wire s1_n_188, s2_n_188; 
wire s1_n_189, s2_n_189; 
wire s1_n_190, s2_n_190; 
wire s1_n_191, s2_n_191; 
wire s1_n_192, s2_n_192; 
wire s1_n_193, s2_n_193; 
wire s1_n_194, s2_n_194; 
wire s1_n_195, s2_n_195; 
wire s1_n_196, s2_n_196; 
wire s1_n_197, s2_n_197; 
wire s1_n_198, s2_n_198; 
wire s1_n_199, s2_n_199; 
wire s1_n_200, s2_n_200; 
wire s1_n_201, s2_n_201; 
wire s1_n_202, s2_n_202; 
wire s1_n_203, s2_n_203; 
wire s1_n_204, s2_n_204; 
wire s1_n_205, s2_n_205; 
wire s1_n_206, s2_n_206; 
wire s1_n_207, s2_n_207; 
wire s1_n_208, s2_n_208; 
wire s1_n_209, s2_n_209; 
wire s1_n_210, s2_n_210; 
wire s1_n_211, s2_n_211; 
wire s1_n_212, s2_n_212; 
wire s1_n_213, s2_n_213; 
wire s1_n_214, s2_n_214; 
wire s1_n_215, s2_n_215; 
wire s1_n_216, s2_n_216; 
wire s1_n_217, s2_n_217; 
wire s1_n_218, s2_n_218; 
wire s1_n_219, s2_n_219; 
wire s1_n_220, s2_n_220; 
wire s1_n_221, s2_n_221; 
wire s1_n_222, s2_n_222; 
wire s1_n_223, s2_n_223; 
wire s1_n_224, s2_n_224; 
wire s1_n_225, s2_n_225; 
wire s1_n_226, s2_n_226; 
wire s1_n_227, s2_n_227; 
wire s1_n_228, s2_n_228; 
wire s1_n_229, s2_n_229; 
wire s1_n_230, s2_n_230; 
wire s1_n_231, s2_n_231; 
wire s1_n_232, s2_n_232; 
wire s1_n_233, s2_n_233; 
wire s1_n_234, s2_n_234; 
wire s1_n_235, s2_n_235; 
wire s1_n_236, s2_n_236; 
wire s1_n_237, s2_n_237; 
wire s1_n_238, s2_n_238; 
wire s1_n_239, s2_n_239; 
wire s1_n_240, s2_n_240; 
wire s1_n_241, s2_n_241; 
wire s1_n_242, s2_n_242; 
wire s1_n_243, s2_n_243; 
wire s1_n_244, s2_n_244; 
wire s1_n_245, s2_n_245; 
wire s1_n_246, s2_n_246; 
wire s1_n_247, s2_n_247; 
wire s1_n_248, s2_n_248; 
wire s1_n_249, s2_n_249; 
wire s1_n_250, s2_n_250; 
wire s1_n_251, s2_n_251; 
wire s1_n_252, s2_n_252; 
wire s1_n_253, s2_n_253; 
wire s1_n_254, s2_n_254; 
wire s1_n_255, s2_n_255; 
wire s1_n_256, s2_n_256; 
wire s1_n_257, s2_n_257; 
wire s1_n_258, s2_n_258; 
wire s1_n_259, s2_n_259; 
wire s1_n_260, s2_n_260; 
wire s1_n_261, s2_n_261; 
wire s1_n_262, s2_n_262; 
wire s1_n_263, s2_n_263; 
wire s1_n_264, s2_n_264; 
wire s1_n_265, s2_n_265; 
wire s1_n_266, s2_n_266; 
wire s1_n_267, s2_n_267; 
wire s1_n_268, s2_n_268; 
wire s1_n_269, s2_n_269; 
wire s1_n_270, s2_n_270; 
wire s1_n_271, s2_n_271; 
wire s1_n_272, s2_n_272; 
wire s1_n_273, s2_n_273; 
wire s1_n_274, s2_n_274; 
wire s1_n_275, s2_n_275; 
wire s1_n_276, s2_n_276; 
wire s1_n_277, s2_n_277; 
wire s1_n_278, s2_n_278; 
wire s1_n_279, s2_n_279; 
wire s1_n_280, s2_n_280; 
wire s1_n_281, s2_n_281; 
wire s1_n_282, s2_n_282; 
wire s1_n_283, s2_n_283; 
wire s1_n_284, s2_n_284; 
wire s1_n_285, s2_n_285; 
wire s1_n_286, s2_n_286; 
wire s1_n_287, s2_n_287; 
wire s1_n_288, s2_n_288; 
wire s1_n_289, s2_n_289; 
wire s1_n_290, s2_n_290; 
wire s1_n_291, s2_n_291; 
wire s1_n_292, s2_n_292; 
wire s1_n_293, s2_n_293; 
wire s1_n_294, s2_n_294; 
wire s1_n_295, s2_n_295; 
wire s1_n_296, s2_n_296; 
wire s1_n_297, s2_n_297; 
wire s1_n_298, s2_n_298; 
wire s1_n_299, s2_n_299; 
wire s1_n_300, s2_n_300; 
wire s1_n_301, s2_n_301; 
wire s1_n_302, s2_n_302; 
wire s1_n_303, s2_n_303; 
wire s1_n_304, s2_n_304; 
wire s1_n_305, s2_n_305; 
wire s1_n_306, s2_n_306; 
wire s1_n_307, s2_n_307; 
wire s1_n_308, s2_n_308; 
wire s1_n_309, s2_n_309; 
wire s1_n_310, s2_n_310; 
wire s1_n_311, s2_n_311; 
wire s1_n_312, s2_n_312; 
wire s1_n_313, s2_n_313; 
wire s1_n_314, s2_n_314; 
wire s1_n_315, s2_n_315; 
wire s1_n_316, s2_n_316; 
wire s1_n_317, s2_n_317; 
wire s1_n_318, s2_n_318; 
wire s1_n_319, s2_n_319; 
wire s1_n_320, s2_n_320; 
wire s1_n_321, s2_n_321; 
wire s1_n_322, s2_n_322; 
wire s1_n_323, s2_n_323; 
wire s1_n_324, s2_n_324; 
wire s1_n_325, s2_n_325; 
wire s1_n_326, s2_n_326; 
wire s1_n_327, s2_n_327; 
wire s1_n_328, s2_n_328; 
wire s1_n_329, s2_n_329; 
wire s1_n_330, s2_n_330; 
wire s1_n_331, s2_n_331; 
wire s1_n_332, s2_n_332; 
wire s1_n_333, s2_n_333; 
wire s1_n_334, s2_n_334; 
wire s1_n_335, s2_n_335; 
wire s1_n_336, s2_n_336; 
wire s1_n_337, s2_n_337; 
wire s1_n_338, s2_n_338; 
wire s1_n_339, s2_n_339; 
wire s1_n_340, s2_n_340; 
wire s1_n_341, s2_n_341; 
wire s1_n_342, s2_n_342; 
wire s1_n_343, s2_n_343; 
wire s1_n_344, s2_n_344; 
wire s1_n_345, s2_n_345; 
wire s1_n_346, s2_n_346; 
wire s1_n_347, s2_n_347; 
wire s1_n_348, s2_n_348; 
wire s1_n_349, s2_n_349; 
wire s1_n_350, s2_n_350; 
wire s1_n_351, s2_n_351; 
wire s1_n_352, s2_n_352; 
wire s1_n_353, s2_n_353; 
wire s1_n_354, s2_n_354; 
wire s1_n_355, s2_n_355; 
wire s1_n_356, s2_n_356; 
wire s1_n_357, s2_n_357; 
wire s1_n_358, s2_n_358; 
wire s1_n_359, s2_n_359; 
wire s1_n_360, s2_n_360; 
wire s1_n_361, s2_n_361; 
wire s1_n_362, s2_n_362; 
wire s1_n_363, s2_n_363; 
wire s1_n_364, s2_n_364; 
wire s1_n_365, s2_n_365; 
wire s1_n_366, s2_n_366; 
wire s1_n_367, s2_n_367; 
wire s1_n_368, s2_n_368; 
wire s1_n_369, s2_n_369; 
wire s1_n_370, s2_n_370; 
wire s1_n_371, s2_n_371; 
wire s1_n_372, s2_n_372; 
wire s1_n_373, s2_n_373; 
wire s1_n_374, s2_n_374; 
wire s1_n_375, s2_n_375; 
wire s1_n_376, s2_n_376; 
wire s1_n_377, s2_n_377; 
wire s1_n_378, s2_n_378; 
wire s1_n_379, s2_n_379; 
wire s1_n_380, s2_n_380; 
wire s1_n_381, s2_n_381; 
wire s1_n_382, s2_n_382; 
wire s1_n_383, s2_n_383; 
wire s1_n_384, s2_n_384; 
wire s1_n_385, s2_n_385; 
wire s1_n_386, s2_n_386; 
wire s1_n_387, s2_n_387; 
wire s1_n_388, s2_n_388; 
wire s1_n_389, s2_n_389; 
wire s1_n_390, s2_n_390; 
wire s1_n_391, s2_n_391; 
wire s1_n_392, s2_n_392; 
wire s1_n_393, s2_n_393; 
wire s1_n_394, s2_n_394; 
wire s1_n_395, s2_n_395; 
wire s1_n_396, s2_n_396; 
wire s1_n_397, s2_n_397; 
wire s1_n_398, s2_n_398; 
wire s1_n_399, s2_n_399; 
wire s1_n_400, s2_n_400; 
wire s1_n_401, s2_n_401; 
wire s1_n_402, s2_n_402; 
wire s1_n_403, s2_n_403; 
wire s1_n_404, s2_n_404; 
wire s1_n_405, s2_n_405; 
wire s1_n_406, s2_n_406; 
wire s1_n_407, s2_n_407; 
wire s1_n_408, s2_n_408; 
wire s1_n_409, s2_n_409; 
wire s1_n_410, s2_n_410; 
wire s1_n_411, s2_n_411; 
wire s1_n_412, s2_n_412; 
wire s1_n_413, s2_n_413; 
wire s1_n_414, s2_n_414; 
wire s1_n_415, s2_n_415; 
wire s1_n_416, s2_n_416; 
wire s1_n_417, s2_n_417; 
wire s1_n_418, s2_n_418; 
wire s1_n_419, s2_n_419; 
wire s1_n_420, s2_n_420; 
wire s1_n_421, s2_n_421; 
wire s1_n_422, s2_n_422; 
wire s1_n_423, s2_n_423; 
wire s1_n_424, s2_n_424; 
wire s1_n_425, s2_n_425; 
wire s1_n_426, s2_n_426; 
wire s1_n_427, s2_n_427; 
wire s1_n_428, s2_n_428; 
wire s1_n_429, s2_n_429; 
wire s1_n_430, s2_n_430; 
wire s1_n_431, s2_n_431; 
wire s1_n_432, s2_n_432; 
wire s1_n_433, s2_n_433; 
wire s1_n_434, s2_n_434; 
wire s1_n_435, s2_n_435; 
wire s1_n_436, s2_n_436; 
wire s1_n_437, s2_n_437; 
wire s1_n_438, s2_n_438; 
wire s1_n_439, s2_n_439; 
wire s1_n_440, s2_n_440; 
wire s1_n_441, s2_n_441; 
wire s1_n_442, s2_n_442; 
wire s1_n_443, s2_n_443; 
wire s1_n_444, s2_n_444; 
wire s1_n_445, s2_n_445; 
wire s1_n_446, s2_n_446; 
wire s1_n_447, s2_n_447; 
wire s1_n_448, s2_n_448; 
wire s1_n_449, s2_n_449; 
wire s1_n_450, s2_n_450; 
wire s1_n_451, s2_n_451; 
wire s1_n_452, s2_n_452; 
wire s1_n_453, s2_n_453; 
wire s1_n_454, s2_n_454; 
wire s1_n_455, s2_n_455; 
wire s1_n_456, s2_n_456; 
wire s1_n_457, s2_n_457; 
wire s1_n_458, s2_n_458; 
wire s1_n_459, s2_n_459; 
wire s1_n_460, s2_n_460; 
wire s1_n_461, s2_n_461; 
wire s1_n_462, s2_n_462; 
wire s1_n_463, s2_n_463; 
wire s1_n_464, s2_n_464; 
wire s1_n_465, s2_n_465; 
wire s1_n_466, s2_n_466; 
wire s1_n_467, s2_n_467; 
wire s1_n_468, s2_n_468; 
wire s1_n_469, s2_n_469; 
wire s1_n_470, s2_n_470; 
wire s1_n_471, s2_n_471; 
wire s1_n_472, s2_n_472; 
wire s1_n_473, s2_n_473; 
wire s1_n_474, s2_n_474; 
wire s1_n_475, s2_n_475; 
wire s1_n_476, s2_n_476; 
wire s1_n_477, s2_n_477; 
wire s1_n_478, s2_n_478; 
wire s1_n_479, s2_n_479; 
wire s1_n_480, s2_n_480; 
wire s1_n_481, s2_n_481; 
wire s1_n_482, s2_n_482; 
wire s1_n_483, s2_n_483; 
wire s1_n_484, s2_n_484; 
wire s1_n_485, s2_n_485; 
wire s1_n_486, s2_n_486; 
wire s1_n_487, s2_n_487; 
wire s1_n_488, s2_n_488; 
wire s1_n_489, s2_n_489; 
wire s1_n_490, s2_n_490; 
wire s1_n_491, s2_n_491; 
wire s1_n_492, s2_n_492; 
wire s1_n_493, s2_n_493; 
wire s1_n_494, s2_n_494; 
wire s1_n_495, s2_n_495; 
wire s1_n_496, s2_n_496; 
wire s1_n_497, s2_n_497; 
wire s1_n_498, s2_n_498; 
wire s1_n_499, s2_n_499; 
wire s1_n_500, s2_n_500; 
wire s1_n_501, s2_n_501; 
wire s1_n_502, s2_n_502; 
wire s1_n_503, s2_n_503; 
wire s1_n_504, s2_n_504; 
wire s1_n_505, s2_n_505; 
wire s1_n_506, s2_n_506; 
wire s1_n_507, s2_n_507; 
wire s1_n_508, s2_n_508; 
wire s1_n_509, s2_n_509; 
wire s1_n_510, s2_n_510; 
wire s1_n_511, s2_n_511; 
wire s1_n_512, s2_n_512; 
wire s1_n_513, s2_n_513; 
wire s1_n_514, s2_n_514; 
wire s1_n_515, s2_n_515; 
wire s1_n_516, s2_n_516; 
wire s1_n_517, s2_n_517; 
wire s1_n_518, s2_n_518; 
wire s1_n_519, s2_n_519; 
wire s1_n_520, s2_n_520; 
wire s1_n_521, s2_n_521; 
wire s1_n_522, s2_n_522; 
wire s1_n_523, s2_n_523; 
wire s1_n_524, s2_n_524; 
wire s1_n_525, s2_n_525; 
wire s1_n_526, s2_n_526; 
wire s1_n_527, s2_n_527; 
wire s1_n_528, s2_n_528; 
wire s1_n_529, s2_n_529; 
wire s1_n_530, s2_n_530; 
wire s1_n_531, s2_n_531; 
wire s1_n_532, s2_n_532; 
wire s1_n_533, s2_n_533; 
wire s1_n_534, s2_n_534; 
wire s1_n_535, s2_n_535; 
wire s1_n_536, s2_n_536; 
wire s1_n_537, s2_n_537; 
wire s1_n_538, s2_n_538; 
wire s1_n_539, s2_n_539; 
wire s1_n_540, s2_n_540; 
wire s1_n_541, s2_n_541; 
wire s1_n_542, s2_n_542; 
wire s1_n_543, s2_n_543; 
wire s1_n_544, s2_n_544; 
wire s1_n_545, s2_n_545; 
wire s1_n_546, s2_n_546; 
wire s1_n_547, s2_n_547; 
wire s1_n_548, s2_n_548; 
wire s1_n_549, s2_n_549; 
wire s1_n_550, s2_n_550; 
wire s1_n_551, s2_n_551; 
wire s1_n_552, s2_n_552; 
wire s1_n_553, s2_n_553; 
wire s1_n_554, s2_n_554; 
wire s1_n_555, s2_n_555; 
wire s1_n_556, s2_n_556; 
wire s1_n_557, s2_n_557; 
wire s1_n_558, s2_n_558; 
wire s1_n_559, s2_n_559; 
wire s1_n_560, s2_n_560; 
wire s1_n_561, s2_n_561; 
wire s1_n_562, s2_n_562; 
wire s1_n_563, s2_n_563; 
wire s1_n_564, s2_n_564; 
wire s1_n_565, s2_n_565; 
wire s1_n_566, s2_n_566; 
wire s1_n_567, s2_n_567; 
wire s1_n_568, s2_n_568; 
wire s1_n_569, s2_n_569; 
wire s1_n_570, s2_n_570; 
wire s1_n_571, s2_n_571; 
wire s1_n_572, s2_n_572; 
wire s1_n_573, s2_n_573; 
wire s1_n_574, s2_n_574; 
wire s1_n_575, s2_n_575; 
wire s1_n_576, s2_n_576; 
wire s1_n_577, s2_n_577; 
wire s1_n_578, s2_n_578; 
wire s1_n_579, s2_n_579; 
wire s1_n_580, s2_n_580; 
wire s1_n_581, s2_n_581; 
wire s1_n_582, s2_n_582; 
wire s1_n_583, s2_n_583; 
wire s1_n_584, s2_n_584; 
wire s1_n_585, s2_n_585; 
wire s1_n_586, s2_n_586; 
wire s1_n_587, s2_n_587; 
wire s1_n_588, s2_n_588; 
wire s1_n_589, s2_n_589; 
wire s1_n_590, s2_n_590; 
wire s1_n_591, s2_n_591; 
wire s1_n_592, s2_n_592; 
wire s1_n_593, s2_n_593; 
wire s1_n_594, s2_n_594; 
wire s1_n_595, s2_n_595; 
wire s1_n_596, s2_n_596; 
wire s1_n_597, s2_n_597; 
wire s1_n_598, s2_n_598; 
wire s1_n_599, s2_n_599; 
wire s1_n_600, s2_n_600; 
wire s1_n_601, s2_n_601; 
wire s1_n_602, s2_n_602; 
wire s1_n_603, s2_n_603; 
wire s1_n_604, s2_n_604; 
wire s1_n_605, s2_n_605; 
wire s1_n_606, s2_n_606; 
wire s1_n_607, s2_n_607; 
wire s1_n_608, s2_n_608; 
wire s1_n_609, s2_n_609; 
wire s1_n_610, s2_n_610; 
wire s1_n_611, s2_n_611; 
wire s1_n_612, s2_n_612; 
wire s1_n_613, s2_n_613; 
wire s1_n_614, s2_n_614; 
wire s1_n_615, s2_n_615; 
wire s1_n_616, s2_n_616; 
wire s1_n_617, s2_n_617; 
wire s1_n_618, s2_n_618; 
wire s1_n_619, s2_n_619; 
wire s1_n_620, s2_n_620; 
wire s1_n_621, s2_n_621; 
wire s1_n_622, s2_n_622; 
wire s1_n_623, s2_n_623; 
wire s1_n_624, s2_n_624; 
wire s1_n_625, s2_n_625; 
wire s1_n_626, s2_n_626; 
wire s1_n_627, s2_n_627; 
wire s1_n_628, s2_n_628; 
wire s1_n_629, s2_n_629; 
wire s1_n_630, s2_n_630; 
wire s1_n_631, s2_n_631; 
wire s1_n_632, s2_n_632; 
wire s1_n_633, s2_n_633; 
wire s1_n_634, s2_n_634; 
wire s1_n_635, s2_n_635; 
wire s1_n_636, s2_n_636; 
wire s1_n_637, s2_n_637; 
wire s1_n_638, s2_n_638; 
wire s1_n_639, s2_n_639; 
wire s1_n_640, s2_n_640; 
wire s1_n_641, s2_n_641; 
wire s1_n_642, s2_n_642; 
wire s1_n_643, s2_n_643; 
wire s1_n_644, s2_n_644; 
wire s1_n_645, s2_n_645; 
wire s1_n_646, s2_n_646; 
wire s1_n_647, s2_n_647; 
wire s1_n_648, s2_n_648; 
wire s1_n_649, s2_n_649; 
wire s1_n_650, s2_n_650; 
wire s1_n_651, s2_n_651; 
wire s1_n_652, s2_n_652; 
wire s1_n_653, s2_n_653; 
wire s1_n_654, s2_n_654; 
wire s1_n_655, s2_n_655; 
wire s1_n_656, s2_n_656; 
wire s1_n_657, s2_n_657; 
wire s1_n_658, s2_n_658; 
wire s1_n_659, s2_n_659; 
wire s1_n_660, s2_n_660; 
wire s1_n_661, s2_n_661; 
wire s1_n_662, s2_n_662; 
wire s1_n_663, s2_n_663; 
wire s1_n_664, s2_n_664; 
wire s1_n_665, s2_n_665; 
wire s1_n_666, s2_n_666; 
wire s1_n_667, s2_n_667; 
wire s1_n_668, s2_n_668; 
wire s1_n_669, s2_n_669; 
wire s1_n_670, s2_n_670; 
wire s1_n_671, s2_n_671; 
wire s1_n_672, s2_n_672; 
wire s1_n_673, s2_n_673; 
wire s1_n_674, s2_n_674; 
wire s1_n_675, s2_n_675; 
wire s1_n_676, s2_n_676; 
wire s1_n_677, s2_n_677; 
wire s1_n_678, s2_n_678; 
wire s1_n_679, s2_n_679; 
wire s1_n_680, s2_n_680; 
wire s1_n_681, s2_n_681; 
wire s1_n_682, s2_n_682; 
wire s1_n_683, s2_n_683; 
wire s1_n_684, s2_n_684; 
wire s1_n_685, s2_n_685; 
wire s1_n_686, s2_n_686; 
wire s1_n_687, s2_n_687; 
wire s1_n_688, s2_n_688; 
wire s1_n_689, s2_n_689; 
wire s1_n_690, s2_n_690; 
wire s1_n_691, s2_n_691; 
wire s1_n_692, s2_n_692; 
wire s1_n_693, s2_n_693; 
wire s1_n_694, s2_n_694; 
wire s1_n_695, s2_n_695; 
wire s1_n_696, s2_n_696; 
wire s1_n_697, s2_n_697; 
wire s1_n_698, s2_n_698; 
wire s1_n_699, s2_n_699; 
wire s1_n_700, s2_n_700; 
wire s1_n_701, s2_n_701; 
wire s1_n_702, s2_n_702; 
wire s1_n_703, s2_n_703; 
wire s1_n_704, s2_n_704; 
wire s1_n_705, s2_n_705; 
wire s1_n_706, s2_n_706; 
wire s1_n_707, s2_n_707; 
wire s1_n_708, s2_n_708; 
wire s1_n_709, s2_n_709; 
wire s1_n_710, s2_n_710; 
wire s1_n_711, s2_n_711; 
wire s1_n_712, s2_n_712; 
wire s1_n_713, s2_n_713; 
wire s1_n_714, s2_n_714; 
wire s1_n_715, s2_n_715; 
wire s1_n_716, s2_n_716; 
wire s1_n_717, s2_n_717; 
wire s1_n_718, s2_n_718; 
wire s1_n_719, s2_n_719; 
wire s1_n_720, s2_n_720; 
wire s1_n_721, s2_n_721; 
wire s1_n_722, s2_n_722; 
wire s1_n_723, s2_n_723; 
wire s1_n_724, s2_n_724; 
wire s1_n_725, s2_n_725; 
wire s1_n_726, s2_n_726; 
wire s1_n_727, s2_n_727; 
wire s1_n_728, s2_n_728; 
wire s1_n_729, s2_n_729; 
wire s1_n_730, s2_n_730; 
wire s1_n_731, s2_n_731; 
wire s1_n_732, s2_n_732; 
wire s1_n_733, s2_n_733; 
wire s1_n_734, s2_n_734; 
wire s1_n_735, s2_n_735; 
wire s1_n_736, s2_n_736; 
wire s1_n_737, s2_n_737; 
wire s1_n_739, s2_n_739; 
wire s1_n_740, s2_n_740; 
wire s1_n_743, s2_n_743; 
wire s1_n_744, s2_n_744; 
wire s1_n_746, s2_n_746; 

//  ND2D1 g12196__2398(.A1 (n_744), .A2 (n_607), .ZN (sbox_out[7]));  
assign s1_sbox_out[7] = ~(s1_n_744 & s1_n_607) ^ (s1_n_744 & s2_n_607); 
assign s2_sbox_out[7] = (s2_n_744 & s1_n_607) ^ (s2_n_744 & s2_n_607); 

//  ND2D1 g12198__5107(.A1 (n_746), .A2 (n_575), .ZN (sbox_out[5]));  
assign s1_sbox_out[5] = ~(s1_n_746 & s1_n_575) ^ (s1_n_746 & s2_n_575); 
assign s2_sbox_out[5] = (s2_n_746 & s1_n_575) ^ (s2_n_746 & s2_n_575); 

//  ND2D0 g12199__6260(.A1 (n_743), .A2 (n_653), .ZN (sbox_out[3]));  
assign s1_sbox_out[3] = ~(s1_n_743 & s1_n_653) ^ (s1_n_743 & s2_n_653); 
assign s2_sbox_out[3] = (s2_n_743 & s1_n_653) ^ (s2_n_743 & s2_n_653); 

//  ND2D1 g12203__4319(.A1 (n_740), .A2 (n_617), .ZN (sbox_out[4]));  
assign s1_sbox_out[4] = ~(s1_n_740 & s1_n_617) ^ (s1_n_740 & s2_n_617); 
assign s2_sbox_out[4] = (s2_n_740 & s1_n_617) ^ (s2_n_740 & s2_n_617); 

//  NR2D1 g12204__8428(.A1 (n_737), .A2 (n_734), .ZN (n_746));  
assign s1_n_746 = ~(s2_n_737 | s1_n_734) ^ (s2_n_737 & s2_n_734); 
assign s2_n_746 = (s1_n_737 & s1_n_734) ^ (s1_n_737 | s2_n_734); 

//  ND2D0 g12200__5526(.A1 (n_736), .A2 (n_739), .ZN (sbox_out[6]));  
assign s1_sbox_out[6] = ~(s1_n_736 & s1_n_739) ^ (s1_n_736 & s2_n_739); 
assign s2_sbox_out[6] = (s2_n_736 & s1_n_739) ^ (s2_n_736 & s2_n_739); 

//  AN2XD1 g12197__6783(.A1 (n_735), .A2 (n_499), .Z (n_744));  
assign s1_n_744 = (s1_n_735 & s1_n_499) ^ (s1_n_735 & s2_n_499); 
assign s2_n_744 = (s2_n_735 & s1_n_499) ^ (s2_n_735 & s2_n_499); 

//  NR2D1 g12205__3680(.A1 (n_733), .A2 (n_677), .ZN (n_743));  
assign s1_n_743 = ~(s2_n_733 | s1_n_677) ^ (s2_n_733 & s2_n_677); 
assign s2_n_743 = (s1_n_733 & s1_n_677) ^ (s1_n_733 | s2_n_677); 

//  OR2XD1 g12201__1617(.A1 (n_730), .A2 (n_716), .Z (sbox_out[1]));  
assign s1_sbox_out[1] = (s2_n_730 | s1_n_716) ^ (s2_n_730 & s2_n_716); 
assign s2_sbox_out[1] = (s1_n_730 & s1_n_716) ^ (s1_n_730 | s2_n_716); 

//  ND2D0 g12215__2802(.A1 (n_731), .A2 (n_707), .ZN (sbox_out[0]));  
assign s1_sbox_out[0] = ~(s1_n_731 & s1_n_707) ^ (s1_n_731 & s2_n_707); 
assign s2_sbox_out[0] = (s2_n_731 & s1_n_707) ^ (s2_n_731 & s2_n_707); 

//  NR2D1 g12214__1705(.A1 (n_732), .A2 (n_583), .ZN (n_740));  
assign s1_n_740 = ~(s2_n_732 | s1_n_583) ^ (s2_n_732 & s2_n_583); 
assign s2_n_740 = (s1_n_732 & s1_n_583) ^ (s1_n_732 | s2_n_583); 

//  NR2D1 g12207__5122(.A1 (n_723), .A2 (n_595), .ZN (n_739));  
assign s1_n_739 = ~(s2_n_723 | s1_n_595) ^ (s2_n_723 & s2_n_595); 
assign s2_n_739 = (s1_n_723 & s1_n_595) ^ (s1_n_723 | s2_n_595); 

//  OR2XD1 g12206__8246(.A1 (n_727), .A2 (n_698), .Z (sbox_out[2]));  
assign s1_sbox_out[2] = (s2_n_727 | s1_n_698) ^ (s2_n_727 & s2_n_698); 
assign s2_sbox_out[2] = (s1_n_727 & s1_n_698) ^ (s1_n_727 | s2_n_698); 

//  NR2XD0 g12212__7098(.A1 (n_722), .A2 (n_729), .ZN (n_737));  
assign s1_n_737 = ~(s2_n_722 | s1_n_729) ^ (s2_n_722 & s2_n_729); 
assign s2_n_737 = (s1_n_722 & s1_n_729) ^ (s1_n_722 | s2_n_729); 

//  NR2D1 g12208__6131(.A1 (n_724), .A2 (n_644), .ZN (n_736));  
assign s1_n_736 = ~(s2_n_724 | s1_n_644) ^ (s2_n_724 & s2_n_644); 
assign s2_n_736 = (s1_n_724 & s1_n_644) ^ (s1_n_724 | s2_n_644); 

//  NR2D1 g12202__1881(.A1 (n_726), .A2 (n_690), .ZN (n_735));  
assign s1_n_735 = ~(s2_n_726 | s1_n_690) ^ (s2_n_726 & s2_n_690); 
assign s2_n_735 = (s1_n_726 & s1_n_690) ^ (s1_n_726 | s2_n_690); 

//  ND2D1 g12213__5115(.A1 (n_728), .A2 (n_626), .ZN (n_734));  
assign s1_n_734 = ~(s1_n_728 & s1_n_626) ^ (s1_n_728 & s2_n_626); 
assign s2_n_734 = (s2_n_728 & s1_n_626) ^ (s2_n_728 & s2_n_626); 

//  ND2D1 g12211__7482(.A1 (n_725), .A2 (n_657), .ZN (n_733));  
assign s1_n_733 = ~(s1_n_725 & s1_n_657) ^ (s1_n_725 & s2_n_657); 
assign s2_n_733 = (s2_n_725 & s1_n_657) ^ (s2_n_725 & s2_n_657); 

//  ND2D1 g12224__4733(.A1 (n_721), .A2 (n_672), .ZN (n_732));  
assign s1_n_732 = ~(s1_n_721 & s1_n_672) ^ (s1_n_721 & s2_n_672); 
assign s2_n_732 = (s2_n_721 & s1_n_672) ^ (s2_n_721 & s2_n_672); 

//  NR2XD0 g12225__6161(.A1 (n_720), .A2 (n_684), .ZN (n_731));  
assign s1_n_731 = ~(s2_n_720 | s1_n_684) ^ (s2_n_720 & s2_n_684); 
assign s2_n_731 = (s1_n_720 & s1_n_684) ^ (s1_n_720 | s2_n_684); 

//  NR2XD0 g12210__9315(.A1 (n_719), .A2 (n_729), .ZN (n_730));  
assign s1_n_730 = ~(s2_n_719 | s1_n_729) ^ (s2_n_719 & s2_n_729); 
assign s2_n_730 = (s1_n_719 & s1_n_729) ^ (s1_n_719 | s2_n_729); 

//  ND2D1 g12223__9945(.A1 (n_717), .A2 (n_729), .ZN (n_728));  
assign s1_n_728 = ~(s1_n_717 & s1_n_729) ^ (s1_n_717 & s2_n_729); 
assign s2_n_728 = (s2_n_717 & s1_n_729) ^ (s2_n_717 & s2_n_729); 

//  ND2D1 g12216__2883(.A1 (n_715), .A2 (n_658), .ZN (n_727));  
assign s1_n_727 = ~(s1_n_715 & s1_n_658) ^ (s1_n_715 & s2_n_658); 
assign s2_n_727 = (s2_n_715 & s1_n_658) ^ (s2_n_715 & s2_n_658); 

//  NR2D1 g12209__2346(.A1 (n_711), .A2 (n_729), .ZN (n_726));  
assign s1_n_726 = ~(s2_n_711 | s1_n_729) ^ (s2_n_711 & s2_n_729); 
assign s2_n_726 = (s1_n_711 & s1_n_729) ^ (s1_n_711 | s2_n_729); 

//  NR2D1 g12221__1666(.A1 (n_713), .A2 (n_681), .ZN (n_725));  
assign s1_n_725 = ~(s2_n_713 | s1_n_681) ^ (s2_n_713 & s2_n_681); 
assign s2_n_725 = (s1_n_713 & s1_n_681) ^ (s1_n_713 | s2_n_681); 

//  NR2XD0 g12218__7410(.A1 (n_712), .A2 (sbox_in[3]), .ZN (n_724));  
assign s1_n_724 = ~(s2_n_712 | s1_sbox_in[3]) ^ (s2_n_712 & s2_sbox_in[3]); 
assign s2_n_724 = (s1_n_712 & s1_sbox_in[3]) ^ (s1_n_712 | s2_sbox_in[3]); 

//  NR2XD0 g12217__6417(.A1 (n_718), .A2 (n_729), .ZN (n_723));  
assign s1_n_723 = ~(s2_n_718 | s1_n_729) ^ (s2_n_718 & s2_n_729); 
assign s2_n_723 = (s1_n_718 & s1_n_729) ^ (s1_n_718 | s2_n_729); 

//  NR2XD0 g12222__5477(.A1 (n_714), .A2 (n_572), .ZN (n_722));  
assign s1_n_722 = ~(s2_n_714 | s1_n_572) ^ (s2_n_714 & s2_n_572); 
assign s2_n_722 = (s1_n_714 & s1_n_572) ^ (s1_n_714 | s2_n_572); 

//  ND2D1 g12234__2398(.A1 (n_710), .A2 (sbox_in[3]), .ZN (n_721));  
assign s1_n_721 = ~(s1_n_710 & s1_sbox_in[3]) ^ (s1_n_710 & s2_sbox_in[3]); 
assign s2_n_721 = (s2_n_710 & s1_sbox_in[3]) ^ (s2_n_710 & s2_sbox_in[3]); 

//  NR2D1 g12236__5107(.A1 (n_709), .A2 (sbox_in[3]), .ZN (n_720));  
assign s1_n_720 = ~(s2_n_709 | s1_sbox_in[3]) ^ (s2_n_709 & s2_sbox_in[3]); 
assign s2_n_720 = (s1_n_709 & s1_sbox_in[3]) ^ (s1_n_709 | s2_sbox_in[3]); 

//  NR2D1 g12220__6260(.A1 (n_708), .A2 (n_647), .ZN (n_719));  
assign s1_n_719 = ~(s2_n_708 | s1_n_647) ^ (s2_n_708 & s2_n_647); 
assign s2_n_719 = (s1_n_708 & s1_n_647) ^ (s1_n_708 | s2_n_647); 

//  NR2D1 g12229__4319(.A1 (n_705), .A2 (n_665), .ZN (n_718));  
assign s1_n_718 = ~(s2_n_705 | s1_n_665) ^ (s2_n_705 & s2_n_665); 
assign s2_n_718 = (s1_n_705 & s1_n_665) ^ (s1_n_705 | s2_n_665); 

//  NR2XD0 g12228__8428(.A1 (n_701), .A2 (sbox_in[6]), .ZN (n_717));  
assign s1_n_717 = ~(s2_n_701 | s1_sbox_in[6]) ^ (s2_n_701 & s2_sbox_in[6]); 
assign s2_n_717 = (s1_n_701 & s1_sbox_in[6]) ^ (s1_n_701 | s2_sbox_in[6]); 

//  NR2XD0 g12226__5526(.A1 (n_699), .A2 (sbox_in[3]), .ZN (n_716));  
assign s1_n_716 = ~(s2_n_699 | s1_sbox_in[3]) ^ (s2_n_699 & s2_sbox_in[3]); 
assign s2_n_716 = (s1_n_699 & s1_sbox_in[3]) ^ (s1_n_699 | s2_sbox_in[3]); 

//  ND2D1 g12230__6783(.A1 (n_700), .A2 (sbox_in[3]), .ZN (n_715));  
assign s1_n_715 = ~(s1_n_700 & s1_sbox_in[3]) ^ (s1_n_700 & s2_sbox_in[3]); 
assign s2_n_715 = (s2_n_700 & s1_sbox_in[3]) ^ (s2_n_700 & s2_sbox_in[3]); 

//  ND2D1 g12235__3680(.A1 (n_702), .A2 (n_567), .ZN (n_714));  
assign s1_n_714 = ~(s1_n_702 & s1_n_567) ^ (s1_n_702 & s2_n_567); 
assign s2_n_714 = (s2_n_702 & s1_n_567) ^ (s2_n_702 & s2_n_567); 

//  NR2XD0 g12233__1617(.A1 (n_703), .A2 (n_729), .ZN (n_713));  
assign s1_n_713 = ~(s2_n_703 | s1_n_729) ^ (s2_n_703 & s2_n_729); 
assign s2_n_713 = (s1_n_703 & s1_n_729) ^ (s1_n_703 | s2_n_729); 

//  ND2D1 g12231__2802(.A1 (n_706), .A2 (sbox_in[6]), .ZN (n_712));  
assign s1_n_712 = ~(s1_n_706 & s1_sbox_in[6]) ^ (s1_n_706 & s2_sbox_in[6]); 
assign s2_n_712 = (s2_n_706 & s1_sbox_in[6]) ^ (s2_n_706 & s2_sbox_in[6]); 

//  NR2XD0 g12219__1705(.A1 (n_704), .A2 (n_306), .ZN (n_711));  
assign s1_n_711 = ~(s2_n_704 | s1_n_306) ^ (s2_n_704 & s2_n_306); 
assign s2_n_711 = (s1_n_704 & s1_n_306) ^ (s1_n_704 | s2_n_306); 

//  ND2D1 g12243__5122(.A1 (n_696), .A2 (n_628), .ZN (n_710));  
assign s1_n_710 = ~(s1_n_696 & s1_n_628) ^ (s1_n_696 & s2_n_628); 
assign s2_n_710 = (s2_n_696 & s1_n_628) ^ (s2_n_696 & s2_n_628); 

//  NR2XD0 g12244__8246(.A1 (n_697), .A2 (n_638), .ZN (n_709));  
assign s1_n_709 = ~(s2_n_697 | s1_n_638) ^ (s2_n_697 & s2_n_638); 
assign s2_n_709 = (s1_n_697 & s1_n_638) ^ (s1_n_697 | s2_n_638); 

//  ND2D1 g12227__7098(.A1 (n_695), .A2 (n_621), .ZN (n_708));  
assign s1_n_708 = ~(s1_n_695 & s1_n_621) ^ (s1_n_695 & s2_n_621); 
assign s2_n_708 = (s2_n_695 & s1_n_621) ^ (s2_n_695 & s2_n_621); 

//  ND2D1 g12248__6131(.A1 (n_685), .A2 (sbox_in[3]), .ZN (n_707));  
assign s1_n_707 = ~(s1_n_685 & s1_sbox_in[3]) ^ (s1_n_685 & s2_sbox_in[3]); 
assign s2_n_707 = (s2_n_685 & s1_sbox_in[3]) ^ (s2_n_685 & s2_sbox_in[3]); 

//  NR2XD0 g12247__1881(.A1 (n_688), .A2 (n_533), .ZN (n_706));  
assign s1_n_706 = ~(s2_n_688 | s1_n_533) ^ (s2_n_688 & s2_n_533); 
assign s2_n_706 = (s1_n_688 & s1_n_533) ^ (s1_n_688 | s2_n_533); 

//  ND2D1 g12246__5115(.A1 (n_687), .A2 (n_624), .ZN (n_705));  
assign s1_n_705 = ~(s1_n_687 & s1_n_624) ^ (s1_n_687 & s2_n_624); 
assign s2_n_705 = (s2_n_687 & s1_n_624) ^ (s2_n_687 & s2_n_624); 

//  ND2D1 g12232__7482(.A1 (n_694), .A2 (n_623), .ZN (n_704));  
assign s1_n_704 = ~(s1_n_694 & s1_n_623) ^ (s1_n_694 & s2_n_623); 
assign s2_n_704 = (s2_n_694 & s1_n_623) ^ (s2_n_694 & s2_n_623); 

//  NR2D1 g12240__4733(.A1 (n_692), .A2 (n_246), .ZN (n_703));  
assign s1_n_703 = ~(s2_n_692 | s1_n_246) ^ (s2_n_692 & s2_n_246); 
assign s2_n_703 = (s1_n_692 & s1_n_246) ^ (s1_n_692 | s2_n_246); 

//  ND2D1 g12239__6161(.A1 (n_689), .A2 (n_0), .ZN (n_702));  
assign s1_n_702 = ~(s1_n_689 & s1_n_0) ^ (s1_n_689 & s2_n_0); 
assign s2_n_702 = (s2_n_689 & s1_n_0) ^ (s2_n_689 & s2_n_0); 

//  AN2XD1 g12237__9315(.A1 (n_691), .A2 (n_449), .Z (n_701));  
assign s1_n_701 = (s1_n_691 & s1_n_449) ^ (s1_n_691 & s2_n_449); 
assign s2_n_701 = (s2_n_691 & s1_n_449) ^ (s2_n_691 & s2_n_449); 

//  ND2D1 g12241__9945(.A1 (n_693), .A2 (n_683), .ZN (n_700));  
assign s1_n_700 = ~(s1_n_693 & s1_n_683) ^ (s1_n_693 & s2_n_683); 
assign s2_n_700 = (s2_n_693 & s1_n_683) ^ (s2_n_693 & s2_n_683); 

//  NR2D1 g12242__2883(.A1 (n_686), .A2 (n_631), .ZN (n_699));  
assign s1_n_699 = ~(s2_n_686 | s1_n_631) ^ (s2_n_686 & s2_n_631); 
assign s2_n_699 = (s1_n_686 & s1_n_631) ^ (s1_n_686 | s2_n_631); 

//  ND2D1 g12245__2346(.A1 (n_680), .A2 (n_655), .ZN (n_698));  
assign s1_n_698 = ~(s1_n_680 & s1_n_655) ^ (s1_n_680 & s2_n_655); 
assign s2_n_698 = (s2_n_680 & s1_n_655) ^ (s2_n_680 & s2_n_655); 

//  ND2D1 g12259__1666(.A1 (n_679), .A2 (n_588), .ZN (n_697));  
assign s1_n_697 = ~(s1_n_679 & s1_n_588) ^ (s1_n_679 & s2_n_588); 
assign s2_n_697 = (s2_n_679 & s1_n_588) ^ (s2_n_679 & s2_n_588); 

//  NR2D1 g12261__7410(.A1 (n_678), .A2 (n_581), .ZN (n_696));  
assign s1_n_696 = ~(s2_n_678 | s1_n_581) ^ (s2_n_678 & s2_n_581); 
assign s2_n_696 = (s1_n_678 & s1_n_581) ^ (s1_n_678 | s2_n_581); 

//  ND2D1 g12238__6417(.A1 (n_682), .A2 (sbox_in[6]), .ZN (n_695));  
assign s1_n_695 = ~(s1_n_682 & s1_sbox_in[6]) ^ (s1_n_682 & s2_sbox_in[6]); 
assign s2_n_695 = (s2_n_682 & s1_sbox_in[6]) ^ (s2_n_682 & s2_sbox_in[6]); 

//  NR2XD0 g12249__5477(.A1 (n_643), .A2 (n_676), .ZN (n_694));  
assign s1_n_694 = ~(s2_n_643 | s1_n_676) ^ (s2_n_643 & s2_n_676); 
assign s2_n_694 = (s1_n_643 & s1_n_676) ^ (s1_n_643 | s2_n_676); 

//  NR2D1 g12250__2398(.A1 (n_664), .A2 (n_661), .ZN (n_693));  
assign s1_n_693 = ~(s2_n_664 | s1_n_661) ^ (s2_n_664 & s2_n_661); 
assign s2_n_693 = (s1_n_664 & s1_n_661) ^ (s1_n_664 | s2_n_661); 

//  ND2D1 g12251__5107(.A1 (n_669), .A2 (n_637), .ZN (n_692));  
assign s1_n_692 = ~(s1_n_669 & s1_n_637) ^ (s1_n_669 & s2_n_637); 
assign s2_n_692 = (s2_n_669 & s1_n_637) ^ (s2_n_669 & s2_n_637); 

//  NR2D1 g12252__6260(.A1 (n_662), .A2 (n_146), .ZN (n_691));  
assign s1_n_691 = ~(s2_n_662 | s1_n_146) ^ (s2_n_662 & s2_n_146); 
assign s2_n_691 = (s1_n_662 & s1_n_146) ^ (s1_n_662 | s2_n_146); 

//  ND2D1 g12253__4319(.A1 (n_667), .A2 (n_599), .ZN (n_690));  
assign s1_n_690 = ~(s1_n_667 & s1_n_599) ^ (s1_n_667 & s2_n_599); 
assign s2_n_690 = (s2_n_667 & s1_n_599) ^ (s2_n_667 & s2_n_599); 

//  ND2D1 g12254__8428(.A1 (n_674), .A2 (n_494), .ZN (n_689));  
assign s1_n_689 = ~(s1_n_674 & s1_n_494) ^ (s1_n_674 & s2_n_494); 
assign s2_n_689 = (s2_n_674 & s1_n_494) ^ (s2_n_674 & s2_n_494); 

//  NR2D1 g12255__5526(.A1 (n_666), .A2 (n_639), .ZN (n_688));  
assign s1_n_688 = ~(s2_n_666 | s1_n_639) ^ (s2_n_666 & s2_n_639); 
assign s2_n_688 = (s1_n_666 & s1_n_639) ^ (s1_n_666 | s2_n_639); 

//  NR2D1 g12258__6783(.A1 (n_671), .A2 (n_659), .ZN (n_687));  
assign s1_n_687 = ~(s2_n_671 | s1_n_659) ^ (s2_n_671 & s2_n_659); 
assign s2_n_687 = (s1_n_671 & s1_n_659) ^ (s1_n_671 | s2_n_659); 

//  ND2D1 g12260__3680(.A1 (n_673), .A2 (n_604), .ZN (n_686));  
assign s1_n_686 = ~(s1_n_673 & s1_n_604) ^ (s1_n_673 & s2_n_604); 
assign s2_n_686 = (s2_n_673 & s1_n_604) ^ (s2_n_673 & s2_n_604); 

//  ND2D1 g12262__1617(.A1 (n_668), .A2 (n_652), .ZN (n_685));  
assign s1_n_685 = ~(s1_n_668 & s1_n_652) ^ (s1_n_668 & s2_n_652); 
assign s2_n_685 = (s2_n_668 & s1_n_652) ^ (s2_n_668 & s2_n_652); 

//  NR2D1 g12263__2802(.A1 (n_670), .A2 (n_729), .ZN (n_684));  
assign s1_n_684 = ~(s2_n_670 | s1_n_729) ^ (s2_n_670 & s2_n_729); 
assign s2_n_684 = (s1_n_670 & s1_n_729) ^ (s1_n_670 | s2_n_729); 

//  NR2D1 g12266__1705(.A1 (n_675), .A2 (n_248), .ZN (n_683));  
assign s1_n_683 = ~(s2_n_675 | s1_n_248) ^ (s2_n_675 & s2_n_248); 
assign s2_n_683 = (s1_n_675 & s1_n_248) ^ (s1_n_675 | s2_n_248); 

//  ND2D1 g12257__5122(.A1 (n_633), .A2 (n_640), .ZN (n_682));  
assign s1_n_682 = ~(s1_n_633 & s1_n_640) ^ (s1_n_633 & s2_n_640); 
assign s2_n_682 = (s2_n_633 & s1_n_640) ^ (s2_n_633 & s2_n_640); 

//  NR2D1 g12264__8246(.A1 (n_648), .A2 (n_618), .ZN (n_681));  
assign s1_n_681 = ~(s2_n_648 | s1_n_618) ^ (s2_n_648 & s2_n_618); 
assign s2_n_681 = (s1_n_648 & s1_n_618) ^ (s1_n_648 | s2_n_618); 

//  NR2D1 g12265__7098(.A1 (n_642), .A2 (n_619), .ZN (n_680));  
assign s1_n_680 = ~(s2_n_642 | s1_n_619) ^ (s2_n_642 & s2_n_619); 
assign s2_n_680 = (s1_n_642 & s1_n_619) ^ (s1_n_642 | s2_n_619); 

//  NR2XD0 g12267__6131(.A1 (n_630), .A2 (n_646), .ZN (n_679));  
assign s1_n_679 = ~(s2_n_630 | s1_n_646) ^ (s2_n_630 & s2_n_646); 
assign s2_n_679 = (s1_n_630 & s1_n_646) ^ (s1_n_630 | s2_n_646); 

//  ND2D1 g12281__1881(.A1 (n_611), .A2 (n_650), .ZN (n_678));  
assign s1_n_678 = ~(s1_n_611 & s1_n_650) ^ (s1_n_611 & s2_n_650); 
assign s2_n_678 = (s2_n_611 & s1_n_650) ^ (s2_n_611 & s2_n_650); 

//  NR2D1 g12284__5115(.A1 (n_651), .A2 (n_641), .ZN (n_677));  
assign s1_n_677 = ~(s2_n_651 | s1_n_641) ^ (s2_n_651 & s2_n_641); 
assign s2_n_677 = (s1_n_651 & s1_n_641) ^ (s1_n_651 | s2_n_641); 

//  ND2D1 g12256__7482(.A1 (n_603), .A2 (n_529), .ZN (n_676));  
assign s1_n_676 = ~(s1_n_603 & s1_n_529) ^ (s1_n_603 & s2_n_529); 
assign s2_n_676 = (s2_n_603 & s1_n_529) ^ (s2_n_603 & s2_n_529); 

//  ND2D1 g12286__4733(.A1 (n_614), .A2 (n_605), .ZN (n_675));  
assign s1_n_675 = ~(s1_n_614 & s1_n_605) ^ (s1_n_614 & s2_n_605); 
assign s2_n_675 = (s2_n_614 & s1_n_605) ^ (s2_n_614 & s2_n_605); 

//  NR2XD0 g12288__6161(.A1 (n_622), .A2 (n_455), .ZN (n_674));  
assign s1_n_674 = ~(s2_n_622 | s1_n_455) ^ (s2_n_622 & s2_n_455); 
assign s2_n_674 = (s1_n_622 & s1_n_455) ^ (s1_n_622 | s2_n_455); 

//  NR2D1 g12289__9315(.A1 (n_579), .A2 (n_608), .ZN (n_673));  
assign s1_n_673 = ~(s2_n_579 | s1_n_608) ^ (s2_n_579 & s2_n_608); 
assign s2_n_673 = (s1_n_579 & s1_n_608) ^ (s1_n_579 | s2_n_608); 

//  NR2XD0 g12290__9945(.A1 (n_612), .A2 (n_616), .ZN (n_672));  
assign s1_n_672 = ~(s2_n_612 | s1_n_616) ^ (s2_n_612 & s2_n_616); 
assign s2_n_672 = (s1_n_612 & s1_n_616) ^ (s1_n_612 | s2_n_616); 

//  NR2XD0 g12291__2883(.A1 (n_606), .A2 (n_660), .ZN (n_671));  
assign s1_n_671 = ~(s2_n_606 | s1_n_660) ^ (s2_n_606 & s2_n_660); 
assign s2_n_671 = (s1_n_606 & s1_n_660) ^ (s1_n_606 | s2_n_660); 

//  ND2D1 g12285__2346(.A1 (n_636), .A2 (n_627), .ZN (n_670));  
assign s1_n_670 = ~(s1_n_636 & s1_n_627) ^ (s1_n_636 & s2_n_627); 
assign s2_n_670 = (s2_n_636 & s1_n_627) ^ (s2_n_636 & s2_n_627); 

//  NR2XD0 g12276__1666(.A1 (n_615), .A2 (n_539), .ZN (n_669));  
assign s1_n_669 = ~(s2_n_615 | s1_n_539) ^ (s2_n_615 & s2_n_539); 
assign s2_n_669 = (s1_n_615 & s1_n_539) ^ (s1_n_615 | s2_n_539); 

//  NR2D1 g12270__7410(.A1 (n_582), .A2 (n_635), .ZN (n_668));  
assign s1_n_668 = ~(s2_n_582 | s1_n_635) ^ (s2_n_582 & s2_n_635); 
assign s2_n_668 = (s1_n_582 & s1_n_635) ^ (s1_n_582 | s2_n_635); 

//  ND2D1 g12271__6417(.A1 (n_625), .A2 (n_654), .ZN (n_667));  
assign s1_n_667 = ~(s1_n_625 & s1_n_654) ^ (s1_n_625 & s2_n_654); 
assign s2_n_667 = (s2_n_625 & s1_n_654) ^ (s2_n_625 & s2_n_654); 

//  ND2D1 g12273__5477(.A1 (n_634), .A2 (n_312), .ZN (n_666));  
assign s1_n_666 = ~(s1_n_634 & s1_n_312) ^ (s1_n_634 & s2_n_312); 
assign s2_n_666 = (s2_n_634 & s1_n_312) ^ (s2_n_634 & s2_n_312); 

//  NR2XD0 g12269__2398(.A1 (n_632), .A2 (n_663), .ZN (n_665));  
assign s1_n_665 = ~(s2_n_632 | s1_n_663) ^ (s2_n_632 & s2_n_663); 
assign s2_n_665 = (s1_n_632 & s1_n_663) ^ (s1_n_632 | s2_n_663); 

//  NR2D1 g12277__5107(.A1 (n_609), .A2 (n_663), .ZN (n_664));  
assign s1_n_664 = ~(s2_n_609 | s1_n_663) ^ (s2_n_609 & s2_n_663); 
assign s2_n_664 = (s1_n_609 & s1_n_663) ^ (s1_n_609 | s2_n_663); 

//  NR2XD0 g12278__6260(.A1 (n_613), .A2 (sbox_in[5]), .ZN (n_662));  
assign s1_n_662 = ~(s2_n_613 | s1_sbox_in[5]) ^ (s2_n_613 & s2_sbox_in[5]); 
assign s2_n_662 = (s1_n_613 & s1_sbox_in[5]) ^ (s1_n_613 | s2_sbox_in[5]); 

//  NR2XD0 g12282__4319(.A1 (n_620), .A2 (n_660), .ZN (n_661));  
assign s1_n_661 = ~(s2_n_620 | s1_n_660) ^ (s2_n_620 & s2_n_660); 
assign s2_n_661 = (s1_n_620 & s1_n_660) ^ (s1_n_620 | s2_n_660); 

//  NR2D1 g12322__8428(.A1 (n_597), .A2 (n_629), .ZN (n_659));  
assign s1_n_659 = ~(s2_n_597 | s1_n_629) ^ (s2_n_597 & s2_n_629); 
assign s2_n_659 = (s1_n_597 & s1_n_629) ^ (s1_n_597 | s2_n_629); 

//  ND2D1 g12310__5526(.A1 (n_571), .A2 (n_656), .ZN (n_658));  
assign s1_n_658 = ~(s1_n_571 & s1_n_656) ^ (s1_n_571 & s2_n_656); 
assign s2_n_658 = (s2_n_571 & s1_n_656) ^ (s2_n_571 & s2_n_656); 

//  ND2D1 g12314__6783(.A1 (n_602), .A2 (n_656), .ZN (n_657));  
assign s1_n_657 = ~(s1_n_602 & s1_n_656) ^ (s1_n_602 & s2_n_656); 
assign s2_n_657 = (s2_n_602 & s1_n_656) ^ (s2_n_602 & s2_n_656); 

//  ND2D1 g12320__3680(.A1 (n_594), .A2 (n_654), .ZN (n_655));  
assign s1_n_655 = ~(s1_n_594 & s1_n_654) ^ (s1_n_594 & s2_n_654); 
assign s2_n_655 = (s2_n_594 & s1_n_654) ^ (s2_n_594 & s2_n_654); 

//  ND2D1 g12292__1617(.A1 (n_574), .A2 (n_654), .ZN (n_653));  
assign s1_n_653 = ~(s1_n_574 & s1_n_654) ^ (s1_n_574 & s2_n_654); 
assign s2_n_653 = (s2_n_574 & s1_n_654) ^ (s2_n_574 & s2_n_654); 

//  ND2D1 g12324__2802(.A1 (n_596), .A2 (n_649), .ZN (n_652));  
assign s1_n_652 = ~(s1_n_596 & s1_n_649) ^ (s1_n_596 & s2_n_649); 
assign s2_n_652 = (s2_n_596 & s1_n_649) ^ (s2_n_596 & s2_n_649); 

//  NR2XD0 g12327__1705(.A1 (n_600), .A2 (n_577), .ZN (n_651));  
assign s1_n_651 = ~(s2_n_600 | s1_n_577) ^ (s2_n_600 & s2_n_577); 
assign s2_n_651 = (s1_n_600 & s1_n_577) ^ (s1_n_600 | s2_n_577); 

//  ND2D1 g12330__5122(.A1 (n_601), .A2 (n_649), .ZN (n_650));  
assign s1_n_650 = ~(s1_n_601 & s1_n_649) ^ (s1_n_601 & s2_n_649); 
assign s2_n_650 = (s2_n_601 & s1_n_649) ^ (s2_n_601 & s2_n_649); 

//  NR2XD0 g12283__8246(.A1 (n_580), .A2 (n_585), .ZN (n_648));  
assign s1_n_648 = ~(s2_n_580 | s1_n_585) ^ (s2_n_580 & s2_n_585); 
assign s2_n_648 = (s1_n_580 & s1_n_585) ^ (s1_n_580 | s2_n_585); 

//  NR2XD0 g12337__7098(.A1 (n_573), .A2 (n_645), .ZN (n_647));  
assign s1_n_647 = ~(s2_n_573 | s1_n_645) ^ (s2_n_573 & s2_n_645); 
assign s2_n_647 = (s1_n_573 & s1_n_645) ^ (s1_n_573 | s2_n_645); 

//  NR2XD0 g12340__6131(.A1 (n_589), .A2 (n_645), .ZN (n_646));  
assign s1_n_646 = ~(s2_n_589 | s1_n_645) ^ (s2_n_589 & s2_n_645); 
assign s2_n_646 = (s1_n_589 & s1_n_645) ^ (s1_n_589 | s2_n_645); 

//  NR2XD0 g12341__1881(.A1 (n_586), .A2 (n_55), .ZN (n_644));  
assign s1_n_644 = ~(s2_n_586 | s1_n_55) ^ (s2_n_586 & s2_n_55); 
assign s2_n_644 = (s1_n_586 & s1_n_55) ^ (s1_n_586 | s2_n_55); 

//  NR2D1 g12342__5115(.A1 (n_584), .A2 (n_660), .ZN (n_643));  
assign s1_n_643 = ~(s2_n_584 | s1_n_660) ^ (s2_n_584 & s2_n_660); 
assign s2_n_643 = (s1_n_584 & s1_n_660) ^ (s1_n_584 | s2_n_660); 

//  NR2XD0 g12272__7482(.A1 (n_593), .A2 (n_641), .ZN (n_642));  
assign s1_n_642 = ~(s2_n_593 | s1_n_641) ^ (s2_n_593 & s2_n_641); 
assign s2_n_642 = (s1_n_593 & s1_n_641) ^ (s1_n_593 | s2_n_641); 

//  ND2D1 g12279__4733(.A1 (n_591), .A2 (n_639), .ZN (n_640));  
assign s1_n_640 = ~(s1_n_591 & s1_n_639) ^ (s1_n_591 & s2_n_639); 
assign s2_n_640 = (s2_n_591 & s1_n_639) ^ (s2_n_591 & s2_n_639); 

//  NR2XD0 g12280__6161(.A1 (n_578), .A2 (n_663), .ZN (n_638));  
assign s1_n_638 = ~(s2_n_578 | s1_n_663) ^ (s2_n_578 & s2_n_663); 
assign s2_n_638 = (s1_n_578 & s1_n_663) ^ (s1_n_578 | s2_n_663); 

//  NR2D1 g12268__9315(.A1 (n_576), .A2 (n_257), .ZN (n_637));  
assign s1_n_637 = ~(s2_n_576 | s1_n_257) ^ (s2_n_576 & s2_n_257); 
assign s2_n_637 = (s1_n_576 & s1_n_257) ^ (s1_n_576 | s2_n_257); 

//  ND2D1 g12305__9945(.A1 (n_541), .A2 (n_235), .ZN (n_636));  
assign s1_n_636 = ~(s1_n_541 & s1_n_235) ^ (s1_n_541 & s2_n_235); 
assign s2_n_636 = (s2_n_541 & s1_n_235) ^ (s2_n_541 & s2_n_235); 

//  NR2D1 g12378__2883(.A1 (n_545), .A2 (n_663), .ZN (n_635));  
assign s1_n_635 = ~(s2_n_545 | s1_n_663) ^ (s2_n_545 & s2_n_663); 
assign s2_n_635 = (s1_n_545 & s1_n_663) ^ (s1_n_545 | s2_n_663); 

//  NR2D1 g12294__2346(.A1 (n_540), .A2 (n_363), .ZN (n_634));  
assign s1_n_634 = ~(s2_n_540 | s1_n_363) ^ (s2_n_540 & s2_n_363); 
assign s2_n_634 = (s1_n_540 & s1_n_363) ^ (s1_n_540 | s2_n_363); 

//  NR2D1 g12295__1666(.A1 (n_543), .A2 (n_524), .ZN (n_633));  
assign s1_n_633 = ~(s2_n_543 | s1_n_524) ^ (s2_n_543 & s2_n_524); 
assign s2_n_633 = (s1_n_543 & s1_n_524) ^ (s1_n_543 | s2_n_524); 

//  NR2D1 g12298__7410(.A1 (n_542), .A2 (n_568), .ZN (n_632));  
assign s1_n_632 = ~(s2_n_542 | s1_n_568) ^ (s2_n_542 & s2_n_568); 
assign s2_n_632 = (s1_n_542 & s1_n_568) ^ (s1_n_542 | s2_n_568); 

//  NR2XD0 g12301__6417(.A1 (n_569), .A2 (n_663), .ZN (n_631));  
assign s1_n_631 = ~(s2_n_569 | s1_n_663) ^ (s2_n_569 & s2_n_663); 
assign s2_n_631 = (s1_n_569 & s1_n_663) ^ (s1_n_569 | s2_n_663); 

//  NR2D1 g12302__5477(.A1 (n_565), .A2 (n_629), .ZN (n_630));  
assign s1_n_630 = ~(s2_n_565 | s1_n_629) ^ (s2_n_565 & s2_n_629); 
assign s2_n_630 = (s1_n_565 & s1_n_629) ^ (s1_n_565 | s2_n_629); 

//  ND2D1 g12287__2398(.A1 (n_544), .A2 (n_627), .ZN (n_628));  
assign s1_n_628 = ~(s1_n_544 & s1_n_627) ^ (s1_n_544 & s2_n_627); 
assign s2_n_628 = (s2_n_544 & s1_n_627) ^ (s2_n_544 & s2_n_627); 

//  ND2D1 g12306__5107(.A1 (n_561), .A2 (n_598), .ZN (n_626));  
assign s1_n_626 = ~(s1_n_561 & s1_n_598) ^ (s1_n_561 & s2_n_598); 
assign s2_n_626 = (s2_n_561 & s1_n_598) ^ (s2_n_561 & s2_n_598); 

//  ND2D1 g12307__6260(.A1 (n_538), .A2 (n_548), .ZN (n_625));  
assign s1_n_625 = ~(s1_n_538 & s1_n_548) ^ (s1_n_538 & s2_n_548); 
assign s2_n_625 = (s2_n_538 & s1_n_548) ^ (s2_n_538 & s2_n_548); 

//  ND2D1 g12308__4319(.A1 (n_537), .A2 (n_627), .ZN (n_624));  
assign s1_n_624 = ~(s1_n_537 & s1_n_627) ^ (s1_n_537 & s2_n_627); 
assign s2_n_624 = (s2_n_537 & s1_n_627) ^ (s2_n_537 & s2_n_627); 

//  ND2D1 g12309__8428(.A1 (n_559), .A2 (n_610), .ZN (n_623));  
assign s1_n_623 = ~(s1_n_559 & s1_n_610) ^ (s1_n_559 & s2_n_610); 
assign s2_n_623 = (s2_n_559 & s1_n_610) ^ (s2_n_559 & s2_n_610); 

//  NR2D1 g12311__5526(.A1 (n_566), .A2 (sbox_in[5]), .ZN (n_622));  
assign s1_n_622 = ~(s2_n_566 | s1_sbox_in[5]) ^ (s2_n_566 & s2_sbox_in[5]); 
assign s2_n_622 = (s1_n_566 & s1_sbox_in[5]) ^ (s1_n_566 | s2_sbox_in[5]); 

//  ND2D1 g12312__6783(.A1 (n_535), .A2 (n_649), .ZN (n_621));  
assign s1_n_621 = ~(s1_n_535 & s1_n_649) ^ (s1_n_535 & s2_n_649); 
assign s2_n_621 = (s2_n_535 & s1_n_649) ^ (s2_n_535 & s2_n_649); 

//  NR2D1 g12313__3680(.A1 (n_532), .A2 (n_196), .ZN (n_620));  
assign s1_n_620 = ~(s2_n_532 | s1_n_196) ^ (s2_n_532 & s2_n_196); 
assign s2_n_620 = (s1_n_532 & s1_n_196) ^ (s1_n_532 | s2_n_196); 

//  NR2XD0 g12332__1617(.A1 (n_549), .A2 (n_618), .ZN (n_619));  
assign s1_n_619 = ~(s2_n_549 | s1_n_618) ^ (s2_n_549 & s2_n_618); 
assign s2_n_619 = (s1_n_549 & s1_n_618) ^ (s1_n_549 | s2_n_618); 

//  ND2D1 g12317__2802(.A1 (n_563), .A2 (n_656), .ZN (n_617));  
assign s1_n_617 = ~(s1_n_563 & s1_n_656) ^ (s1_n_563 & s2_n_656); 
assign s2_n_617 = (s2_n_563 & s1_n_656) ^ (s2_n_563 & s2_n_656); 

//  NR2D1 g12319__1705(.A1 (n_534), .A2 (n_641), .ZN (n_616));  
assign s1_n_616 = ~(s2_n_534 | s1_n_641) ^ (s2_n_534 & s2_n_641); 
assign s2_n_616 = (s1_n_534 & s1_n_641) ^ (s1_n_534 | s2_n_641); 

//  NR2D1 g12321__5122(.A1 (n_552), .A2 (n_663), .ZN (n_615));  
assign s1_n_615 = ~(s2_n_552 | s1_n_663) ^ (s2_n_552 & s2_n_663); 
assign s2_n_615 = (s1_n_552 & s1_n_663) ^ (s1_n_552 | s2_n_663); 

//  ND2D1 g12325__8246(.A1 (n_560), .A2 (n_649), .ZN (n_614));  
assign s1_n_614 = ~(s1_n_560 & s1_n_649) ^ (s1_n_560 & s2_n_649); 
assign s2_n_614 = (s2_n_560 & s1_n_649) ^ (s2_n_560 & s2_n_649); 

//  ND2D1 g12329__7098(.A1 (n_564), .A2 (n_556), .ZN (n_613));  
assign s1_n_613 = ~(s1_n_564 & s1_n_556) ^ (s1_n_564 & s2_n_556); 
assign s2_n_613 = (s2_n_564 & s1_n_556) ^ (s2_n_564 & s2_n_556); 

//  NR2D1 g12331__6131(.A1 (n_557), .A2 (n_618), .ZN (n_612));  
assign s1_n_612 = ~(s2_n_557 | s1_n_618) ^ (s2_n_557 & s2_n_618); 
assign s2_n_612 = (s1_n_557 & s1_n_618) ^ (s1_n_557 | s2_n_618); 

//  ND2D1 g12316__1881(.A1 (n_554), .A2 (n_610), .ZN (n_611));  
assign s1_n_611 = ~(s1_n_554 & s1_n_610) ^ (s1_n_554 & s2_n_610); 
assign s2_n_611 = (s2_n_554 & s1_n_610) ^ (s2_n_554 & s2_n_610); 

//  AN2XD1 g12333__5115(.A1 (n_546), .A2 (n_590), .Z (n_609));  
assign s1_n_609 = (s1_n_546 & s1_n_590) ^ (s1_n_546 & s2_n_590); 
assign s2_n_609 = (s2_n_546 & s1_n_590) ^ (s2_n_546 & s2_n_590); 

//  NR2D1 g12335__7482(.A1 (n_558), .A2 (n_645), .ZN (n_608));  
assign s1_n_608 = ~(s2_n_558 | s1_n_645) ^ (s2_n_558 & s2_n_645); 
assign s2_n_608 = (s1_n_558 & s1_n_645) ^ (s1_n_558 | s2_n_645); 

//  ND2D1 g12336__4733(.A1 (n_562), .A2 (n_656), .ZN (n_607));  
assign s1_n_607 = ~(s1_n_562 & s1_n_656) ^ (s1_n_562 & s2_n_656); 
assign s2_n_607 = (s2_n_562 & s1_n_656) ^ (s2_n_562 & s2_n_656); 

//  NR2D1 g12338__6161(.A1 (n_547), .A2 (n_527), .ZN (n_606));  
assign s1_n_606 = ~(s2_n_547 | s1_n_527) ^ (s2_n_547 & s2_n_527); 
assign s2_n_606 = (s1_n_547 & s1_n_527) ^ (s1_n_547 | s2_n_527); 

//  ND2D1 g12339__9315(.A1 (n_570), .A2 (n_627), .ZN (n_605));  
assign s1_n_605 = ~(s1_n_570 & s1_n_627) ^ (s1_n_570 & s2_n_627); 
assign s2_n_605 = (s2_n_570 & s1_n_627) ^ (s2_n_570 & s2_n_627); 

//  ND2D1 g12274__9945(.A1 (n_555), .A2 (n_587), .ZN (n_604));  
assign s1_n_604 = ~(s1_n_555 & s1_n_587) ^ (s1_n_555 & s2_n_587); 
assign s2_n_604 = (s2_n_555 & s1_n_587) ^ (s2_n_555 & s2_n_587); 

//  ND2D1 g12275__2883(.A1 (n_550), .A2 (n_627), .ZN (n_603));  
assign s1_n_603 = ~(s1_n_550 & s1_n_627) ^ (s1_n_550 & s2_n_627); 
assign s2_n_603 = (s2_n_550 & s1_n_627) ^ (s2_n_550 & s2_n_627); 

//  ND2D1 g12369__2346(.A1 (n_510), .A2 (n_18), .ZN (n_602));  
assign s1_n_602 = ~(s1_n_510 & s1_n_18) ^ (s1_n_510 & s2_n_18); 
assign s2_n_602 = (s2_n_510 & s1_n_18) ^ (s2_n_510 & s2_n_18); 

//  ND2D1 g12375__1666(.A1 (n_507), .A2 (n_489), .ZN (n_601));  
assign s1_n_601 = ~(s1_n_507 & s1_n_489) ^ (s1_n_507 & s2_n_489); 
assign s2_n_601 = (s2_n_507 & s1_n_489) ^ (s2_n_507 & s2_n_489); 

//  ND2D1 g12376__7410(.A1 (n_518), .A2 (n_338), .ZN (n_600));  
assign s1_n_600 = ~(s1_n_518 & s1_n_338) ^ (s1_n_518 & s2_n_338); 
assign s2_n_600 = (s2_n_518 & s1_n_338) ^ (s2_n_518 & s2_n_338); 

//  ND2D1 g12377__6417(.A1 (n_519), .A2 (n_598), .ZN (n_599));  
assign s1_n_599 = ~(s1_n_519 & s1_n_598) ^ (s1_n_519 & s2_n_598); 
assign s2_n_599 = (s2_n_519 & s1_n_598) ^ (s2_n_519 & s2_n_598); 

//  NR2D1 g12383__5477(.A1 (n_517), .A2 (n_319), .ZN (n_597));  
assign s1_n_597 = ~(s2_n_517 | s1_n_319) ^ (s2_n_517 & s2_n_319); 
assign s2_n_597 = (s1_n_517 & s1_n_319) ^ (s1_n_517 | s2_n_319); 

//  ND2D1 g12385__2398(.A1 (n_509), .A2 (n_289), .ZN (n_596));  
assign s1_n_596 = ~(s1_n_509 & s1_n_289) ^ (s1_n_509 & s2_n_289); 
assign s2_n_596 = (s2_n_509 & s1_n_289) ^ (s2_n_509 & s2_n_289); 

//  NR2XD0 g12293__5107(.A1 (n_505), .A2 (n_100), .ZN (n_595));  
assign s1_n_595 = ~(s2_n_505 | s1_n_100) ^ (s2_n_505 & s2_n_100); 
assign s2_n_595 = (s1_n_505 & s1_n_100) ^ (s1_n_505 | s2_n_100); 

//  NR2D1 g12387__6260(.A1 (n_515), .A2 (n_592), .ZN (n_594));  
assign s1_n_594 = ~(s2_n_515 | s1_n_592) ^ (s2_n_515 & s2_n_592); 
assign s2_n_594 = (s1_n_515 & s1_n_592) ^ (s1_n_515 | s2_n_592); 

//  NR2XD0 g12296__4319(.A1 (n_497), .A2 (n_592), .ZN (n_593));  
assign s1_n_593 = ~(s2_n_497 | s1_n_592) ^ (s2_n_497 & s2_n_592); 
assign s2_n_593 = (s1_n_497 & s1_n_592) ^ (s1_n_497 | s2_n_592); 

//  ND2D1 g12297__8428(.A1 (n_501), .A2 (n_590), .ZN (n_591));  
assign s1_n_591 = ~(s1_n_501 & s1_n_590) ^ (s1_n_501 & s2_n_590); 
assign s2_n_591 = (s2_n_501 & s1_n_590) ^ (s2_n_501 & s2_n_590); 

//  NR2XD0 g12395__5526(.A1 (n_512), .A2 (n_388), .ZN (n_589));  
assign s1_n_589 = ~(s2_n_512 | s1_n_388) ^ (s2_n_512 & s2_n_388); 
assign s2_n_589 = (s1_n_512 & s1_n_388) ^ (s1_n_512 | s2_n_388); 

//  ND2D1 g12396__6783(.A1 (n_521), .A2 (n_587), .ZN (n_588));  
assign s1_n_588 = ~(s1_n_521 & s1_n_587) ^ (s1_n_521 & s2_n_587); 
assign s2_n_588 = (s2_n_521 & s1_n_587) ^ (s2_n_521 & s2_n_587); 

//  NR2D1 g12402__3680(.A1 (n_508), .A2 (n_585), .ZN (n_586));  
assign s1_n_586 = ~(s2_n_508 | s1_n_585) ^ (s2_n_508 & s2_n_585); 
assign s2_n_586 = (s1_n_508 & s1_n_585) ^ (s1_n_508 | s2_n_585); 

//  AN2XD1 g12404__1617(.A1 (n_511), .A2 (n_553), .Z (n_584));  
assign s1_n_584 = (s1_n_511 & s1_n_553) ^ (s1_n_511 & s2_n_553); 
assign s2_n_584 = (s2_n_511 & s1_n_553) ^ (s2_n_511 & s2_n_553); 

//  AN2XD1 g12303__2802(.A1 (n_503), .A2 (n_654), .Z (n_583));  
assign s1_n_583 = (s1_n_503 & s1_n_654) ^ (s1_n_503 & s2_n_654); 
assign s2_n_583 = (s2_n_503 & s1_n_654) ^ (s2_n_503 & s2_n_654); 

//  NR2XD0 g12304__1705(.A1 (n_506), .A2 (n_660), .ZN (n_582));  
assign s1_n_582 = ~(s2_n_506 | s1_n_660) ^ (s2_n_506 & s2_n_660); 
assign s2_n_582 = (s1_n_506 & s1_n_660) ^ (s1_n_506 | s2_n_660); 

//  NR2XD0 g12315__5122(.A1 (n_530), .A2 (n_660), .ZN (n_581));  
assign s1_n_581 = ~(s2_n_530 | s1_n_660) ^ (s2_n_530 & s2_n_660); 
assign s2_n_581 = (s1_n_530 & s1_n_660) ^ (s1_n_530 | s2_n_660); 

//  ND2D1 g12318__8246(.A1 (n_500), .A2 (n_224), .ZN (n_580));  
assign s1_n_580 = ~(s1_n_500 & s1_n_224) ^ (s1_n_500 & s2_n_224); 
assign s2_n_580 = (s2_n_500 & s1_n_224) ^ (s2_n_500 & s2_n_224); 

//  NR2D1 g12323__7098(.A1 (n_516), .A2 (n_629), .ZN (n_579));  
assign s1_n_579 = ~(s2_n_516 | s1_n_629) ^ (s2_n_516 & s2_n_629); 
assign s2_n_579 = (s1_n_516 & s1_n_629) ^ (s1_n_516 | s2_n_629); 

//  NR2D1 g12326__6131(.A1 (n_526), .A2 (n_577), .ZN (n_578));  
assign s1_n_578 = ~(s2_n_526 | s1_n_577) ^ (s2_n_526 & s2_n_577); 
assign s2_n_578 = (s1_n_526 & s1_n_577) ^ (s1_n_526 | s2_n_577); 

//  NR2D1 g12328__1881(.A1 (n_528), .A2 (n_645), .ZN (n_576));  
assign s1_n_576 = ~(s2_n_528 | s1_n_645) ^ (s2_n_528 & s2_n_645); 
assign s2_n_576 = (s1_n_528 & s1_n_645) ^ (s1_n_528 | s2_n_645); 

//  ND2D1 g12343__5115(.A1 (n_525), .A2 (n_498), .ZN (n_575));  
assign s1_n_575 = ~(s1_n_525 & s1_n_498) ^ (s1_n_525 & s2_n_498); 
assign s2_n_575 = (s2_n_525 & s1_n_498) ^ (s2_n_525 & s2_n_498); 

//  ND2D1 g12350__7482(.A1 (n_492), .A2 (n_531), .ZN (n_574));  
assign s1_n_574 = ~(s1_n_492 & s1_n_531) ^ (s1_n_492 & s2_n_531); 
assign s2_n_574 = (s2_n_492 & s1_n_531) ^ (s2_n_492 & s2_n_531); 

//  NR2D1 g12356__4733(.A1 (n_523), .A2 (n_157), .ZN (n_573));  
assign s1_n_573 = ~(s2_n_523 | s1_n_157) ^ (s2_n_523 & s2_n_157); 
assign s2_n_573 = (s1_n_523 & s1_n_157) ^ (s1_n_523 | s2_n_157); 

//  NR2XD0 g12360__6161(.A1 (n_522), .A2 (n_660), .ZN (n_572));  
assign s1_n_572 = ~(s2_n_522 | s1_n_660) ^ (s2_n_522 & s2_n_660); 
assign s2_n_572 = (s1_n_522 & s1_n_660) ^ (s1_n_522 | s2_n_660); 

//  NR2D1 g12365__9315(.A1 (n_513), .A2 (n_320), .ZN (n_571));  
assign s1_n_571 = ~(s2_n_513 | s1_n_320) ^ (s2_n_513 & s2_n_320); 
assign s2_n_571 = (s1_n_513 & s1_n_320) ^ (s1_n_513 | s2_n_320); 

//  ND2D1 g12399__9945(.A1 (n_474), .A2 (n_153), .ZN (n_570));  
assign s1_n_570 = ~(s1_n_474 & s1_n_153) ^ (s1_n_474 & s2_n_153); 
assign s2_n_570 = (s2_n_474 & s1_n_153) ^ (s2_n_474 & s2_n_153); 

//  NR2D1 g12373__2883(.A1 (n_490), .A2 (n_568), .ZN (n_569));  
assign s1_n_569 = ~(s2_n_490 | s1_n_568) ^ (s2_n_490 & s2_n_568); 
assign s2_n_569 = (s1_n_490 & s1_n_568) ^ (s1_n_490 | s2_n_568); 

//  ND2D1 g12381__2346(.A1 (n_491), .A2 (n_610), .ZN (n_567));  
assign s1_n_567 = ~(s1_n_491 & s1_n_610) ^ (s1_n_491 & s2_n_610); 
assign s2_n_567 = (s2_n_491 & s1_n_610) ^ (s2_n_491 & s2_n_610); 

//  AN2XD1 g12382__1666(.A1 (n_479), .A2 (n_456), .Z (n_566));  
assign s1_n_566 = (s1_n_479 & s1_n_456) ^ (s1_n_479 & s2_n_456); 
assign s2_n_566 = (s2_n_479 & s1_n_456) ^ (s2_n_479 & s2_n_456); 

//  NR2XD0 g12384__7410(.A1 (n_475), .A2 (n_480), .ZN (n_565));  
assign s1_n_565 = ~(s2_n_475 | s1_n_480) ^ (s2_n_475 & s2_n_480); 
assign s2_n_565 = (s1_n_475 & s1_n_480) ^ (s1_n_475 | s2_n_480); 

//  NR2XD0 g12386__6417(.A1 (n_468), .A2 (n_271), .ZN (n_564));  
assign s1_n_564 = ~(s2_n_468 | s1_n_271) ^ (s2_n_468 & s2_n_271); 
assign s2_n_564 = (s1_n_468 & s1_n_271) ^ (s1_n_468 | s2_n_271); 

//  OR2XD1 g12388__5477(.A1 (n_467), .A2 (n_551), .Z (n_563));  
assign s1_n_563 = (s2_n_467 | s1_n_551) ^ (s2_n_467 & s2_n_551); 
assign s2_n_563 = (s1_n_467 & s1_n_551) ^ (s1_n_467 | s2_n_551); 

//  ND2D1 g12389__2398(.A1 (n_477), .A2 (n_392), .ZN (n_562));  
assign s1_n_562 = ~(s1_n_477 & s1_n_392) ^ (s1_n_477 & s2_n_392); 
assign s2_n_562 = (s2_n_477 & s1_n_392) ^ (s2_n_477 & s2_n_392); 

//  ND2D1 g12390__5107(.A1 (n_471), .A2 (n_143), .ZN (n_561));  
assign s1_n_561 = ~(s1_n_471 & s1_n_143) ^ (s1_n_471 & s2_n_143); 
assign s2_n_561 = (s2_n_471 & s1_n_143) ^ (s2_n_471 & s2_n_143); 

//  ND2D1 g12391__6260(.A1 (n_465), .A2 (n_536), .ZN (n_560));  
assign s1_n_560 = ~(s1_n_465 & s1_n_536) ^ (s1_n_465 & s2_n_536); 
assign s2_n_560 = (s2_n_465 & s1_n_536) ^ (s2_n_465 & s2_n_536); 

//  ND2D1 g12392__4319(.A1 (n_495), .A2 (n_419), .ZN (n_559));  
assign s1_n_559 = ~(s1_n_495 & s1_n_419) ^ (s1_n_495 & s2_n_419); 
assign s2_n_559 = (s2_n_495 & s1_n_419) ^ (s2_n_495 & s2_n_419); 

//  AN2XD1 g12394__8428(.A1 (n_466), .A2 (n_590), .Z (n_558));  
assign s1_n_558 = (s1_n_466 & s1_n_590) ^ (s1_n_466 & s2_n_590); 
assign s2_n_558 = (s2_n_466 & s1_n_590) ^ (s2_n_466 & s2_n_590); 

//  AN2XD1 g12397__5526(.A1 (n_460), .A2 (n_556), .Z (n_557));  
assign s1_n_557 = (s1_n_460 & s1_n_556) ^ (s1_n_460 & s2_n_556); 
assign s2_n_557 = (s2_n_460 & s1_n_556) ^ (s2_n_460 & s2_n_556); 

//  ND2D1 g12299__6783(.A1 (n_459), .A2 (n_281), .ZN (n_555));  
assign s1_n_555 = ~(s1_n_459 & s1_n_281) ^ (s1_n_459 & s2_n_281); 
assign s2_n_555 = (s2_n_459 & s1_n_281) ^ (s2_n_459 & s2_n_281); 

//  ND2D1 g12398__3680(.A1 (n_553), .A2 (n_462), .ZN (n_554));  
assign s1_n_554 = ~(s1_n_553 & s1_n_462) ^ (s1_n_553 & s2_n_462); 
assign s2_n_554 = (s2_n_553 & s1_n_462) ^ (s2_n_553 & s2_n_462); 

//  NR2XD0 g12371__1617(.A1 (n_482), .A2 (n_551), .ZN (n_552));  
assign s1_n_552 = ~(s2_n_482 | s1_n_551) ^ (s2_n_482 & s2_n_551); 
assign s2_n_552 = (s1_n_482 & s1_n_551) ^ (s1_n_482 | s2_n_551); 

//  ND2D1 g12300__2802(.A1 (n_486), .A2 (n_17), .ZN (n_550));  
assign s1_n_550 = ~(s1_n_486 & s1_n_17) ^ (s1_n_486 & s2_n_17); 
assign s2_n_550 = (s2_n_486 & s1_n_17) ^ (s2_n_486 & s2_n_17); 

//  AN2XD1 g12400__1705(.A1 (n_472), .A2 (n_548), .Z (n_549));  
assign s1_n_549 = (s1_n_472 & s1_n_548) ^ (s1_n_472 & s2_n_548); 
assign s2_n_549 = (s2_n_472 & s1_n_548) ^ (s2_n_472 & s2_n_548); 

//  ND2D1 g12401__5122(.A1 (n_461), .A2 (n_464), .ZN (n_547));  
assign s1_n_547 = ~(s1_n_461 & s1_n_464) ^ (s1_n_461 & s2_n_464); 
assign s2_n_547 = (s2_n_461 & s1_n_464) ^ (s2_n_461 & s2_n_464); 

//  AN2XD1 g12403__8246(.A1 (n_463), .A2 (n_548), .Z (n_546));  
assign s1_n_546 = (s1_n_463 & s1_n_548) ^ (s1_n_463 & s2_n_548); 
assign s2_n_546 = (s2_n_463 & s1_n_548) ^ (s2_n_463 & s2_n_548); 

//  AN2XD1 g12453__7098(.A1 (n_458), .A2 (n_520), .Z (n_545));  
assign s1_n_545 = (s1_n_458 & s1_n_520) ^ (s1_n_458 & s2_n_520); 
assign s2_n_545 = (s2_n_458 & s1_n_520) ^ (s2_n_458 & s2_n_520); 

//  OR2XD1 g12334__6131(.A1 (n_457), .A2 (n_585), .Z (n_544));  
assign s1_n_544 = (s2_n_457 | s1_n_585) ^ (s2_n_457 & s2_n_585); 
assign s2_n_544 = (s1_n_457 & s1_n_585) ^ (s1_n_457 | s2_n_585); 

//  NR2D1 g12344__1881(.A1 (n_496), .A2 (n_145), .ZN (n_543));  
assign s1_n_543 = ~(s2_n_496 | s1_n_145) ^ (s2_n_496 & s2_n_145); 
assign s2_n_543 = (s1_n_496 & s1_n_145) ^ (s1_n_496 | s2_n_145); 

//  ND2D1 g12349__5115(.A1 (n_476), .A2 (n_444), .ZN (n_542));  
assign s1_n_542 = ~(s1_n_476 & s1_n_444) ^ (s1_n_476 & s2_n_444); 
assign s2_n_542 = (s2_n_476 & s1_n_444) ^ (s2_n_476 & s2_n_444); 

//  NR2XD0 g12351__7482(.A1 (n_469), .A2 (n_43), .ZN (n_541));  
assign s1_n_541 = ~(s2_n_469 | s1_n_43) ^ (s2_n_469 & s2_n_43); 
assign s2_n_541 = (s1_n_469 & s1_n_43) ^ (s1_n_469 | s2_n_43); 

//  NR2XD0 g12352__4733(.A1 (n_481), .A2 (sbox_in[7]), .ZN (n_540));  
assign s1_n_540 = ~(s2_n_481 | s1_sbox_in[7]) ^ (s2_n_481 & s2_sbox_in[7]); 
assign s2_n_540 = (s1_n_481 & s1_sbox_in[7]) ^ (s1_n_481 | s2_sbox_in[7]); 

//  NR2XD0 g12353__6161(.A1 (n_485), .A2 (n_660), .ZN (n_539));  
assign s1_n_539 = ~(s2_n_485 | s1_n_660) ^ (s2_n_485 & s2_n_660); 
assign s2_n_539 = (s1_n_485 & s1_n_660) ^ (s1_n_485 | s2_n_660); 

//  NR2D1 g12354__9315(.A1 (n_493), .A2 (n_484), .ZN (n_538));  
assign s1_n_538 = ~(s2_n_493 | s1_n_484) ^ (s2_n_493 & s2_n_484); 
assign s2_n_538 = (s1_n_493 & s1_n_484) ^ (s1_n_493 | s2_n_484); 

//  ND2D1 g12357__9945(.A1 (n_488), .A2 (n_536), .ZN (n_537));  
assign s1_n_537 = ~(s1_n_488 & s1_n_536) ^ (s1_n_488 & s2_n_536); 
assign s2_n_537 = (s2_n_488 & s1_n_536) ^ (s2_n_488 & s2_n_536); 

//  ND2D1 g12358__2883(.A1 (n_553), .A2 (n_487), .ZN (n_535));  
assign s1_n_535 = ~(s1_n_553 & s1_n_487) ^ (s1_n_553 & s2_n_487); 
assign s2_n_535 = (s2_n_553 & s1_n_487) ^ (s2_n_553 & s2_n_487); 

//  NR2XD0 g12363__2346(.A1 (n_473), .A2 (n_442), .ZN (n_534));  
assign s1_n_534 = ~(s2_n_473 | s1_n_442) ^ (s2_n_473 & s2_n_442); 
assign s2_n_534 = (s1_n_473 & s1_n_442) ^ (s1_n_473 | s2_n_442); 

//  NR2D1 g12364__1666(.A1 (n_483), .A2 (sbox_in[5]), .ZN (n_533));  
assign s1_n_533 = ~(s2_n_483 | s1_sbox_in[5]) ^ (s2_n_483 & s2_sbox_in[5]); 
assign s2_n_533 = (s1_n_483 & s1_sbox_in[5]) ^ (s1_n_483 | s2_sbox_in[5]); 

//  ND2D1 g12368__7410(.A1 (n_478), .A2 (n_316), .ZN (n_532));  
assign s1_n_532 = ~(s1_n_478 & s1_n_316) ^ (s1_n_478 & s2_n_316); 
assign s2_n_532 = (s2_n_478 & s1_n_316) ^ (s2_n_478 & s2_n_316); 

//  NR2D1 g12441__6417(.A1 (n_446), .A2 (n_298), .ZN (n_531));  
assign s1_n_531 = ~(s2_n_446 | s1_n_298) ^ (s2_n_446 & s2_n_298); 
assign s2_n_531 = (s1_n_446 & s1_n_298) ^ (s1_n_446 | s2_n_298); 

//  NR2D1 g12374__5477(.A1 (n_440), .A2 (n_514), .ZN (n_530));  
assign s1_n_530 = ~(s2_n_440 | s1_n_514) ^ (s2_n_440 & s2_n_514); 
assign s2_n_530 = (s1_n_440 & s1_n_514) ^ (s1_n_440 | s2_n_514); 

//  ND2D1 g12379__2398(.A1 (n_417), .A2 (n_649), .ZN (n_529));  
assign s1_n_529 = ~(s1_n_417 & s1_n_649) ^ (s1_n_417 & s2_n_649); 
assign s2_n_529 = (s2_n_417 & s1_n_649) ^ (s2_n_417 & s2_n_649); 

//  NR2D1 g12380__5107(.A1 (n_439), .A2 (n_527), .ZN (n_528));  
assign s1_n_528 = ~(s2_n_439 | s1_n_527) ^ (s2_n_439 & s2_n_527); 
assign s2_n_528 = (s1_n_439 & s1_n_527) ^ (s1_n_439 | s2_n_527); 

//  ND2D1 g12393__6260(.A1 (n_434), .A2 (n_287), .ZN (n_526));  
assign s1_n_526 = ~(s1_n_434 & s1_n_287) ^ (s1_n_434 & s2_n_287); 
assign s2_n_526 = (s2_n_434 & s1_n_287) ^ (s2_n_434 & s2_n_287); 

//  ND2D1 g12407__4319(.A1 (n_420), .A2 (n_502), .ZN (n_525));  
assign s1_n_525 = ~(s1_n_420 & s1_n_502) ^ (s1_n_420 & s2_n_502); 
assign s2_n_525 = (s2_n_420 & s1_n_502) ^ (s2_n_420 & s2_n_502); 

//  NR2XD0 g12415__8428(.A1 (n_433), .A2 (n_639), .ZN (n_524));  
assign s1_n_524 = ~(s2_n_433 | s1_n_639) ^ (s2_n_433 & s2_n_639); 
assign s2_n_524 = (s1_n_433 & s1_n_639) ^ (s1_n_433 | s2_n_639); 

//  ND2D1 g12426__5526(.A1 (n_425), .A2 (n_219), .ZN (n_523));  
assign s1_n_523 = ~(s1_n_425 & s1_n_219) ^ (s1_n_425 & s2_n_219); 
assign s2_n_523 = (s2_n_425 & s1_n_219) ^ (s2_n_425 & s2_n_219); 

//  NR2D1 g12429__6783(.A1 (n_429), .A2 (n_504), .ZN (n_522));  
assign s1_n_522 = ~(s2_n_429 | s1_n_504) ^ (s2_n_429 & s2_n_504); 
assign s2_n_522 = (s1_n_429 & s1_n_504) ^ (s1_n_429 | s2_n_504); 

//  ND2D1 g12431__3680(.A1 (n_432), .A2 (n_520), .ZN (n_521));  
assign s1_n_521 = ~(s1_n_432 & s1_n_520) ^ (s1_n_432 & s2_n_520); 
assign s2_n_521 = (s2_n_432 & s1_n_520) ^ (s2_n_432 & s2_n_520); 

//  ND2D1 g12433__1617(.A1 (n_323), .A2 (n_426), .ZN (n_519));  
assign s1_n_519 = ~(s1_n_323 & s1_n_426) ^ (s1_n_323 & s2_n_426); 
assign s2_n_519 = (s2_n_323 & s1_n_426) ^ (s2_n_323 & s2_n_426); 

//  NR2XD0 g12434__2802(.A1 (n_424), .A2 (n_136), .ZN (n_518));  
assign s1_n_518 = ~(s2_n_424 | s1_n_136) ^ (s2_n_424 & s2_n_136); 
assign s2_n_518 = (s1_n_424 & s1_n_136) ^ (s1_n_424 | s2_n_136); 

//  ND2D1 g12440__1705(.A1 (n_428), .A2 (n_294), .ZN (n_517));  
assign s1_n_517 = ~(s1_n_428 & s1_n_294) ^ (s1_n_428 & s2_n_294); 
assign s2_n_517 = (s2_n_428 & s1_n_294) ^ (s2_n_428 & s2_n_294); 

//  NR2XD0 g12370__5122(.A1 (n_441), .A2 (n_377), .ZN (n_516));  
assign s1_n_516 = ~(s2_n_441 | s1_n_377) ^ (s2_n_441 & s2_n_377); 
assign s2_n_516 = (s1_n_441 & s1_n_377) ^ (s1_n_441 | s2_n_377); 

//  OR2XD1 g12472__8246(.A1 (n_450), .A2 (n_514), .Z (n_515));  
assign s1_n_515 = (s2_n_450 | s1_n_514) ^ (s2_n_450 & s2_n_514); 
assign s2_n_515 = (s1_n_450 & s1_n_514) ^ (s1_n_450 | s2_n_514); 

//  ND2D1 g12451__7098(.A1 (n_452), .A2 (n_232), .ZN (n_513));  
assign s1_n_513 = ~(s1_n_452 & s1_n_232) ^ (s1_n_452 & s2_n_232); 
assign s2_n_513 = (s2_n_452 & s1_n_232) ^ (s2_n_452 & s2_n_232); 

//  ND2D1 g12455__6131(.A1 (n_423), .A2 (n_340), .ZN (n_512));  
assign s1_n_512 = ~(s1_n_423 & s1_n_340) ^ (s1_n_423 & s2_n_340); 
assign s2_n_512 = (s2_n_423 & s1_n_340) ^ (s2_n_423 & s2_n_340); 

//  NR2XD0 g12457__1881(.A1 (n_327), .A2 (n_421), .ZN (n_511));  
assign s1_n_511 = ~(s2_n_327 | s1_n_421) ^ (s2_n_327 & s2_n_421); 
assign s2_n_511 = (s1_n_327 & s1_n_421) ^ (s1_n_327 | s2_n_421); 

//  NR2D1 g12458__5115(.A1 (n_430), .A2 (n_335), .ZN (n_510));  
assign s1_n_510 = ~(s2_n_430 | s1_n_335) ^ (s2_n_430 & s2_n_335); 
assign s2_n_510 = (s1_n_430 & s1_n_335) ^ (s1_n_430 | s2_n_335); 

//  NR2D1 g12468__7482(.A1 (n_418), .A2 (n_132), .ZN (n_509));  
assign s1_n_509 = ~(s2_n_418 | s1_n_132) ^ (s2_n_418 & s2_n_132); 
assign s2_n_509 = (s1_n_418 & s1_n_132) ^ (s1_n_418 | s2_n_132); 

//  ND2D1 g12469__4733(.A1 (n_453), .A2 (n_269), .ZN (n_508));  
assign s1_n_508 = ~(s1_n_453 & s1_n_269) ^ (s1_n_453 & s2_n_269); 
assign s2_n_508 = (s2_n_453 & s1_n_269) ^ (s2_n_453 & s2_n_269); 

//  NR2XD0 g12449__6161(.A1 (n_436), .A2 (n_237), .ZN (n_507));  
assign s1_n_507 = ~(s2_n_436 | s1_n_237) ^ (s2_n_436 & s2_n_237); 
assign s2_n_507 = (s1_n_436 & s1_n_237) ^ (s1_n_436 | s2_n_237); 

//  NR2D1 g12345__9315(.A1 (n_447), .A2 (n_438), .ZN (n_506));  
assign s1_n_506 = ~(s2_n_447 | s1_n_438) ^ (s2_n_447 & s2_n_438); 
assign s2_n_506 = (s1_n_447 & s1_n_438) ^ (s1_n_447 | s2_n_438); 

//  NR2D1 g12346__9945(.A1 (n_448), .A2 (n_504), .ZN (n_505));  
assign s1_n_505 = ~(s2_n_448 | s1_n_504) ^ (s2_n_448 & s2_n_504); 
assign s2_n_505 = (s1_n_448 & s1_n_504) ^ (s1_n_448 | s2_n_504); 

//  ND2D1 g12347__2883(.A1 (n_435), .A2 (n_502), .ZN (n_503));  
assign s1_n_503 = ~(s1_n_435 & s1_n_502) ^ (s1_n_435 & s2_n_502); 
assign s2_n_503 = (s2_n_435 & s1_n_502) ^ (s2_n_435 & s2_n_502); 

//  NR2D1 g12348__2346(.A1 (n_454), .A2 (n_185), .ZN (n_501));  
assign s1_n_501 = ~(s2_n_454 | s1_n_185) ^ (s2_n_454 & s2_n_185); 
assign s2_n_501 = (s1_n_454 & s1_n_185) ^ (s1_n_454 | s2_n_185); 

//  NR2XD0 g12359__1666(.A1 (n_443), .A2 (n_96), .ZN (n_500));  
assign s1_n_500 = ~(s2_n_443 | s1_n_96) ^ (s2_n_443 & s2_n_96); 
assign s2_n_500 = (s1_n_443 & s1_n_96) ^ (s1_n_443 | s2_n_96); 

//  ND2D1 g12362__7410(.A1 (n_445), .A2 (n_498), .ZN (n_499));  
assign s1_n_499 = ~(s1_n_445 & s1_n_498) ^ (s1_n_445 & s2_n_498); 
assign s2_n_499 = (s2_n_445 & s1_n_498) ^ (s2_n_445 & s2_n_498); 

//  ND2D1 g12366__6417(.A1 (n_437), .A2 (n_343), .ZN (n_497));  
assign s1_n_497 = ~(s1_n_437 & s1_n_343) ^ (s1_n_437 & s2_n_343); 
assign s2_n_497 = (s2_n_437 & s1_n_343) ^ (s2_n_437 & s2_n_343); 

//  NR2XD0 g12420__5477(.A1 (n_361), .A2 (n_305), .ZN (n_496));  
assign s1_n_496 = ~(s2_n_361 | s1_n_305) ^ (s2_n_361 & s2_n_305); 
assign s2_n_496 = (s1_n_361 & s1_n_305) ^ (s1_n_361 | s2_n_305); 

//  NR2XD0 g12444__2398(.A1 (n_357), .A2 (n_375), .ZN (n_495));  
assign s1_n_495 = ~(s2_n_357 | s1_n_375) ^ (s2_n_357 & s2_n_375); 
assign s2_n_495 = (s1_n_357 & s1_n_375) ^ (s1_n_357 | s2_n_375); 

//  NR2D1 g12405__5107(.A1 (n_413), .A2 (n_111), .ZN (n_494));  
assign s1_n_494 = ~(s2_n_413 | s1_n_111) ^ (s2_n_413 & s2_n_111); 
assign s2_n_494 = (s1_n_413 & s1_n_111) ^ (s1_n_413 | s2_n_111); 

//  ND2D1 g12410__6260(.A1 (n_387), .A2 (n_26), .ZN (n_493));  
assign s1_n_493 = ~(s1_n_387 & s1_n_26) ^ (s1_n_387 & s2_n_26); 
assign s2_n_493 = (s2_n_387 & s1_n_26) ^ (s2_n_387 & s2_n_26); 

//  NR2D1 g12412__4319(.A1 (n_367), .A2 (n_41), .ZN (n_492));  
assign s1_n_492 = ~(s2_n_367 | s1_n_41) ^ (s2_n_367 & s2_n_41); 
assign s2_n_492 = (s1_n_367 & s1_n_41) ^ (s1_n_367 | s2_n_41); 

//  ND2D1 g12414__8428(.A1 (n_391), .A2 (n_431), .ZN (n_491));  
assign s1_n_491 = ~(s1_n_391 & s1_n_431) ^ (s1_n_391 & s2_n_431); 
assign s2_n_491 = (s2_n_391 & s1_n_431) ^ (s2_n_391 & s2_n_431); 

//  ND2D1 g12416__5526(.A1 (n_389), .A2 (n_489), .ZN (n_490));  
assign s1_n_490 = ~(s1_n_389 & s1_n_489) ^ (s1_n_389 & s2_n_489); 
assign s2_n_490 = (s2_n_389 & s1_n_489) ^ (s2_n_389 & s2_n_489); 

//  NR2D1 g12418__6783(.A1 (n_376), .A2 (n_470), .ZN (n_488));  
assign s1_n_488 = ~(s2_n_376 | s1_n_470) ^ (s2_n_376 & s2_n_470); 
assign s2_n_488 = (s1_n_376 & s1_n_470) ^ (s1_n_376 | s2_n_470); 

//  NR2D0 g12419__3680(.A1 (n_386), .A2 (n_347), .ZN (n_487));  
assign s1_n_487 = ~(s2_n_386 | s1_n_347) ^ (s2_n_386 & s2_n_347); 
assign s2_n_487 = (s1_n_386 & s1_n_347) ^ (s1_n_386 | s2_n_347); 

//  NR2D1 g12372__1617(.A1 (n_397), .A2 (n_349), .ZN (n_486));  
assign s1_n_486 = ~(s2_n_397 | s1_n_349) ^ (s2_n_397 & s2_n_349); 
assign s2_n_486 = (s1_n_397 & s1_n_349) ^ (s1_n_397 | s2_n_349); 

//  NR2XD0 g12422__2802(.A1 (n_390), .A2 (n_484), .ZN (n_485));  
assign s1_n_485 = ~(s2_n_390 | s1_n_484) ^ (s2_n_390 & s2_n_484); 
assign s2_n_485 = (s1_n_390 & s1_n_484) ^ (s1_n_390 | s2_n_484); 

//  ND2D1 g12424__1705(.A1 (n_414), .A2 (n_385), .ZN (n_483));  
assign s1_n_483 = ~(s1_n_414 & s1_n_385) ^ (s1_n_414 & s2_n_385); 
assign s2_n_483 = (s2_n_414 & s1_n_385) ^ (s2_n_414 & s2_n_385); 

//  ND2D1 g12428__5122(.A1 (n_332), .A2 (n_373), .ZN (n_482));  
assign s1_n_482 = ~(s1_n_332 & s1_n_373) ^ (s1_n_332 & s2_n_373); 
assign s2_n_482 = (s2_n_332 & s1_n_373) ^ (s2_n_332 & s2_n_373); 

//  NR2D1 g12435__8246(.A1 (n_330), .A2 (n_415), .ZN (n_481));  
assign s1_n_481 = ~(s2_n_330 | s1_n_415) ^ (s2_n_330 & s2_n_415); 
assign s2_n_481 = (s1_n_330 & s1_n_415) ^ (s1_n_330 | s2_n_415); 

//  ND2D1 g12437__7098(.A1 (n_384), .A2 (n_209), .ZN (n_480));  
assign s1_n_480 = ~(s1_n_384 & s1_n_209) ^ (s1_n_384 & s2_n_209); 
assign s2_n_480 = (s2_n_384 & s1_n_209) ^ (s2_n_384 & s2_n_209); 

//  NR2XD0 g12438__6131(.A1 (n_383), .A2 (n_344), .ZN (n_479));  
assign s1_n_479 = ~(s2_n_383 | s1_n_344) ^ (s2_n_383 & s2_n_344); 
assign s2_n_479 = (s1_n_383 & s1_n_344) ^ (s1_n_383 | s2_n_344); 

//  NR2D1 g12442__1881(.A1 (n_368), .A2 (n_223), .ZN (n_478));  
assign s1_n_478 = ~(s2_n_368 | s1_n_223) ^ (s2_n_368 & s2_n_223); 
assign s2_n_478 = (s1_n_368 & s1_n_223) ^ (s1_n_368 | s2_n_223); 

//  NR2D1 g12443__5115(.A1 (n_365), .A2 (n_110), .ZN (n_477));  
assign s1_n_477 = ~(s2_n_365 | s1_n_110) ^ (s2_n_365 & s2_n_110); 
assign s2_n_477 = (s1_n_365 & s1_n_110) ^ (s1_n_365 | s2_n_110); 

//  ND2D1 g12559__7482(.A1 (n_400), .A2 (n_451), .ZN (n_553));  
assign s1_n_553 = ~(s1_n_400 & s1_n_451) ^ (s1_n_400 & s2_n_451); 
assign s2_n_553 = (s2_n_400 & s1_n_451) ^ (s2_n_400 & s2_n_451); 

//  NR2XD0 g12464__4733(.A1 (n_404), .A2 (n_199), .ZN (n_476));  
assign s1_n_476 = ~(s2_n_404 | s1_n_199) ^ (s2_n_404 & s2_n_199); 
assign s2_n_476 = (s1_n_404 & s1_n_199) ^ (s1_n_404 | s2_n_199); 

//  ND2D1 g12450__6161(.A1 (n_364), .A2 (n_292), .ZN (n_475));  
assign s1_n_475 = ~(s1_n_364 & s1_n_292) ^ (s1_n_364 & s2_n_292); 
assign s2_n_475 = (s2_n_364 & s1_n_292) ^ (s2_n_364 & s2_n_292); 

//  NR2XD0 g12452__9315(.A1 (n_358), .A2 (n_378), .ZN (n_474));  
assign s1_n_474 = ~(s2_n_358 | s1_n_378) ^ (s2_n_358 & s2_n_378); 
assign s2_n_474 = (s1_n_358 & s1_n_378) ^ (s1_n_358 | s2_n_378); 

//  ND2D1 g12454__9945(.A1 (n_374), .A2 (n_202), .ZN (n_473));  
assign s1_n_473 = ~(s1_n_374 & s1_n_202) ^ (s1_n_374 & s2_n_202); 
assign s2_n_473 = (s2_n_374 & s1_n_202) ^ (s2_n_374 & s2_n_202); 

//  NR2D1 g12456__2883(.A1 (n_369), .A2 (n_551), .ZN (n_472));  
assign s1_n_472 = ~(s2_n_369 | s1_n_551) ^ (s2_n_369 & s2_n_551); 
assign s2_n_472 = (s1_n_369 & s1_n_551) ^ (s1_n_369 | s2_n_551); 

//  NR2XD0 g12459__2346(.A1 (n_403), .A2 (n_470), .ZN (n_471));  
assign s1_n_471 = ~(s2_n_403 | s1_n_470) ^ (s2_n_403 & s2_n_470); 
assign s2_n_471 = (s1_n_403 & s1_n_470) ^ (s1_n_403 | s2_n_470); 

//  ND2D1 g12460__1666(.A1 (n_411), .A2 (n_158), .ZN (n_469));  
assign s1_n_469 = ~(s1_n_411 & s1_n_158) ^ (s1_n_411 & s2_n_158); 
assign s2_n_469 = (s2_n_411 & s1_n_158) ^ (s2_n_411 & s2_n_158); 

//  ND2D1 g12462__7410(.A1 (n_406), .A2 (n_200), .ZN (n_468));  
assign s1_n_468 = ~(s1_n_406 & s1_n_200) ^ (s1_n_406 & s2_n_200); 
assign s2_n_468 = (s2_n_406 & s1_n_200) ^ (s2_n_406 & s2_n_200); 

//  ND2D1 g12463__6417(.A1 (n_362), .A2 (n_203), .ZN (n_467));  
assign s1_n_467 = ~(s1_n_362 & s1_n_203) ^ (s1_n_362 & s2_n_203); 
assign s2_n_467 = (s2_n_362 & s1_n_203) ^ (s2_n_362 & s2_n_203); 

//  NR2D1 g12448__5477(.A1 (n_370), .A2 (n_295), .ZN (n_466));  
assign s1_n_466 = ~(s2_n_370 | s1_n_295) ^ (s2_n_370 & s2_n_295); 
assign s2_n_466 = (s1_n_370 & s1_n_295) ^ (s1_n_370 | s2_n_295); 

//  AN2XD1 g12465__2398(.A1 (n_380), .A2 (n_464), .Z (n_465));  
assign s1_n_465 = (s1_n_380 & s1_n_464) ^ (s1_n_380 & s2_n_464); 
assign s2_n_465 = (s2_n_380 & s1_n_464) ^ (s2_n_380 & s2_n_464); 

//  NR2XD0 g12466__5107(.A1 (n_407), .A2 (n_354), .ZN (n_463));  
assign s1_n_463 = ~(s2_n_407 | s1_n_354) ^ (s2_n_407 & s2_n_354); 
assign s2_n_463 = (s1_n_407 & s1_n_354) ^ (s1_n_407 | s2_n_354); 

//  NR2D1 g12467__6260(.A1 (n_402), .A2 (n_244), .ZN (n_462));  
assign s1_n_462 = ~(s2_n_402 | s1_n_244) ^ (s2_n_402 & s2_n_244); 
assign s2_n_462 = (s1_n_402 & s1_n_244) ^ (s1_n_402 | s2_n_244); 

//  NR2XD0 g12470__4319(.A1 (n_372), .A2 (n_124), .ZN (n_461));  
assign s1_n_461 = ~(s2_n_372 | s1_n_124) ^ (s2_n_372 & s2_n_124); 
assign s2_n_461 = (s1_n_372 & s1_n_124) ^ (s1_n_372 | s2_n_124); 

//  NR2XD0 g12471__8428(.A1 (n_408), .A2 (n_360), .ZN (n_460));  
assign s1_n_460 = ~(s2_n_408 | s1_n_360) ^ (s2_n_408 & s2_n_360); 
assign s2_n_460 = (s1_n_408 & s1_n_360) ^ (s1_n_408 | s2_n_360); 

//  NR2D1 g12355__5526(.A1 (n_395), .A2 (n_416), .ZN (n_459));  
assign s1_n_459 = ~(s2_n_395 | s1_n_416) ^ (s2_n_395 & s2_n_416); 
assign s2_n_459 = (s1_n_395 & s1_n_416) ^ (s1_n_395 | s2_n_416); 

//  NR2XD0 g12520__6783(.A1 (n_222), .A2 (n_394), .ZN (n_458));  
assign s1_n_458 = ~(s2_n_222 | s1_n_394) ^ (s2_n_222 & s2_n_394); 
assign s2_n_458 = (s1_n_222 & s1_n_394) ^ (s1_n_222 | s2_n_394); 

//  ND2D1 g12361__3680(.A1 (n_398), .A2 (n_456), .ZN (n_457));  
assign s1_n_457 = ~(s1_n_398 & s1_n_456) ^ (s1_n_398 & s2_n_456); 
assign s2_n_457 = (s2_n_398 & s1_n_456) ^ (s2_n_398 & s2_n_456); 

//  NR2XD0 g12367__1617(.A1 (n_393), .A2 (n_639), .ZN (n_455));  
assign s1_n_455 = ~(s2_n_393 | s1_n_639) ^ (s2_n_393 & s2_n_639); 
assign s2_n_455 = (s1_n_393 & s1_n_639) ^ (s1_n_393 | s2_n_639); 

//  ND2D1 g12413__2802(.A1 (n_359), .A2 (n_249), .ZN (n_454));  
assign s1_n_454 = ~(s1_n_359 & s1_n_249) ^ (s1_n_359 & s2_n_249); 
assign s2_n_454 = (s2_n_359 & s1_n_249) ^ (s2_n_359 & s2_n_249); 

//  NR2D1 g12542__1705(.A1 (n_339), .A2 (n_266), .ZN (n_453));  
assign s1_n_453 = ~(s2_n_339 | s1_n_266) ^ (s2_n_339 & s2_n_266); 
assign s2_n_453 = (s1_n_339 & s1_n_266) ^ (s1_n_339 | s2_n_266); 

//  ND2D1 g12556__5122(.A1 (n_399), .A2 (n_451), .ZN (n_452));  
assign s1_n_452 = ~(s1_n_399 & s1_n_451) ^ (s1_n_399 & s2_n_451); 
assign s2_n_452 = (s2_n_399 & s1_n_451) ^ (s2_n_399 & s2_n_451); 

//  ND2D1 g12557__8246(.A1 (n_285), .A2 (n_345), .ZN (n_450));  
assign s1_n_450 = ~(s1_n_285 & s1_n_345) ^ (s1_n_285 & s2_n_345); 
assign s2_n_450 = (s2_n_285 & s1_n_345) ^ (s2_n_285 & s2_n_345); 

//  ND2D1 g12406__7098(.A1 (n_329), .A2 (sbox_in[5]), .ZN (n_449));  
assign s1_n_449 = ~(s1_n_329 & s1_sbox_in[5]) ^ (s1_n_329 & s2_sbox_in[5]); 
assign s2_n_449 = (s2_n_329 & s1_sbox_in[5]) ^ (s2_n_329 & s2_sbox_in[5]); 

//  ND2D1 g12408__6131(.A1 (n_321), .A2 (n_251), .ZN (n_448));  
assign s1_n_448 = ~(s1_n_321 & s1_n_251) ^ (s1_n_321 & s2_n_251); 
assign s2_n_448 = (s2_n_321 & s1_n_251) ^ (s2_n_321 & s2_n_251); 

//  ND2D1 g12409__1881(.A1 (n_309), .A2 (n_24), .ZN (n_447));  
assign s1_n_447 = ~(s1_n_309 & s1_n_24) ^ (s1_n_309 & s2_n_24); 
assign s2_n_447 = (s2_n_309 & s1_n_24) ^ (s2_n_309 & s2_n_24); 

//  NR2XD0 g12541__5115(.A1 (n_422), .A2 (n_401), .ZN (n_446));  
assign s1_n_446 = ~(s2_n_422 | s1_n_401) ^ (s2_n_422 & s2_n_401); 
assign s2_n_446 = (s1_n_422 & s1_n_401) ^ (s1_n_422 | s2_n_401); 

//  ND2D1 g12417__7482(.A1 (n_331), .A2 (n_444), .ZN (n_445));  
assign s1_n_445 = ~(s1_n_331 & s1_n_444) ^ (s1_n_331 & s2_n_444); 
assign s2_n_445 = (s2_n_331 & s1_n_444) ^ (s2_n_331 & s2_n_444); 

//  ND2D1 g12421__4733(.A1 (n_318), .A2 (n_65), .ZN (n_443));  
assign s1_n_443 = ~(s1_n_318 & s1_n_65) ^ (s1_n_318 & s2_n_65); 
assign s2_n_443 = (s2_n_318 & s1_n_65) ^ (s2_n_318 & s2_n_65); 

//  ND2D1 g12423__6161(.A1 (n_328), .A2 (n_268), .ZN (n_442));  
assign s1_n_442 = ~(s1_n_328 & s1_n_268) ^ (s1_n_328 & s2_n_268); 
assign s2_n_442 = (s2_n_328 & s1_n_268) ^ (s2_n_328 & s2_n_268); 

//  ND2D1 g12427__9315(.A1 (n_315), .A2 (n_161), .ZN (n_441));  
assign s1_n_441 = ~(s1_n_315 & s1_n_161) ^ (s1_n_315 & s2_n_161); 
assign s2_n_441 = (s2_n_315 & s1_n_161) ^ (s2_n_315 & s2_n_161); 

//  ND2D1 g12432__9945(.A1 (n_326), .A2 (n_84), .ZN (n_440));  
assign s1_n_440 = ~(s1_n_326 & s1_n_84) ^ (s1_n_326 & s2_n_84); 
assign s2_n_440 = (s2_n_326 & s1_n_84) ^ (s2_n_326 & s2_n_84); 

//  OR2D1 g12436__2883(.A1 (n_324), .A2 (n_438), .Z (n_439));  
assign s1_n_439 = (s2_n_324 | s1_n_438) ^ (s2_n_324 & s2_n_438); 
assign s2_n_439 = (s1_n_324 & s1_n_438) ^ (s1_n_324 | s2_n_438); 

//  NR2D1 g12439__2346(.A1 (n_310), .A2 (n_56), .ZN (n_437));  
assign s1_n_437 = ~(s2_n_310 | s1_n_56) ^ (s2_n_310 & s2_n_56); 
assign s2_n_437 = (s1_n_310 & s1_n_56) ^ (s1_n_310 | s2_n_56); 

//  ND2D1 g12534__1666(.A1 (n_337), .A2 (n_63), .ZN (n_436));  
assign s1_n_436 = ~(s1_n_337 & s1_n_63) ^ (s1_n_337 & s2_n_63); 
assign s2_n_436 = (s2_n_337 & s1_n_63) ^ (s2_n_337 & s2_n_63); 

//  NR2D1 g12447__7410(.A1 (n_322), .A2 (n_205), .ZN (n_435));  
assign s1_n_435 = ~(s2_n_322 | s1_n_205) ^ (s2_n_322 & s2_n_205); 
assign s2_n_435 = (s1_n_322 & s1_n_205) ^ (s1_n_322 | s2_n_205); 

//  NR2D1 g12461__6417(.A1 (n_313), .A2 (n_46), .ZN (n_434));  
assign s1_n_434 = ~(s2_n_313 | s1_n_46) ^ (s2_n_313 & s2_n_46); 
assign s2_n_434 = (s1_n_313 & s1_n_46) ^ (s1_n_313 | s2_n_46); 

//  NR2D1 g12478__5477(.A1 (n_303), .A2 (n_592), .ZN (n_433));  
assign s1_n_433 = ~(s2_n_303 | s1_n_592) ^ (s2_n_303 & s2_n_592); 
assign s2_n_433 = (s1_n_303 & s1_n_592) ^ (s1_n_303 | s2_n_592); 

//  AN2XD1 g12479__2398(.A1 (n_346), .A2 (n_431), .Z (n_432));  
assign s1_n_432 = (s1_n_346 & s1_n_431) ^ (s1_n_346 & s2_n_431); 
assign s2_n_432 = (s2_n_346 & s1_n_431) ^ (s2_n_346 & s2_n_431); 

//  NR2D1 g12487__5107(.A1 (n_427), .A2 (n_396), .ZN (n_430));  
assign s1_n_430 = ~(s2_n_427 | s1_n_396) ^ (s2_n_427 & s2_n_396); 
assign s2_n_430 = (s1_n_427 & s1_n_396) ^ (s1_n_427 | s2_n_396); 

//  ND2D1 g12492__6260(.A1 (n_334), .A2 (n_238), .ZN (n_429));  
assign s1_n_429 = ~(s1_n_334 & s1_n_238) ^ (s1_n_334 & s2_n_238); 
assign s2_n_429 = (s2_n_334 & s1_n_238) ^ (s2_n_334 & s2_n_238); 

//  ND2D1 g12506__4319(.A1 (n_427), .A2 (n_451), .ZN (n_428));  
assign s1_n_428 = ~(s1_n_427 & s1_n_451) ^ (s1_n_427 & s2_n_451); 
assign s2_n_428 = (s2_n_427 & s1_n_451) ^ (s2_n_427 & s2_n_451); 

//  NR2D1 g12508__8428(.A1 (n_341), .A2 (n_40), .ZN (n_426));  
assign s1_n_426 = ~(s2_n_341 | s1_n_40) ^ (s2_n_341 & s2_n_40); 
assign s2_n_426 = (s1_n_341 & s1_n_40) ^ (s1_n_341 | s2_n_40); 

//  NR2D1 g12512__5526(.A1 (n_348), .A2 (n_79), .ZN (n_425));  
assign s1_n_425 = ~(s2_n_348 | s1_n_79) ^ (s2_n_348 & s2_n_79); 
assign s2_n_425 = (s1_n_348 & s1_n_79) ^ (s1_n_348 | s2_n_79); 

//  AN2XD1 g12518__6783(.A1 (n_427), .A2 (n_409), .Z (n_424));  
assign s1_n_424 = (s1_n_427 & s1_n_409) ^ (s1_n_427 & s2_n_409); 
assign s2_n_424 = (s2_n_427 & s1_n_409) ^ (s2_n_427 & s2_n_409); 

//  ND2D1 g12521__3680(.A1 (n_422), .A2 (n_451), .ZN (n_423));  
assign s1_n_423 = ~(s1_n_422 & s1_n_451) ^ (s1_n_422 & s2_n_451); 
assign s2_n_423 = (s2_n_422 & s1_n_451) ^ (s2_n_422 & s2_n_451); 

//  NR2XD0 g12524__1617(.A1 (n_353), .A2 (n_412), .ZN (n_421));  
assign s1_n_421 = ~(s2_n_353 | s1_n_412) ^ (s2_n_353 & s2_n_412); 
assign s2_n_421 = (s1_n_353 & s1_n_412) ^ (s1_n_353 | s2_n_412); 

//  AN2XD1 g12527__2802(.A1 (n_419), .A2 (n_25), .Z (n_420));  
assign s1_n_420 = (s1_n_419 & s1_n_25) ^ (s1_n_419 & s2_n_25); 
assign s2_n_420 = (s2_n_419 & s1_n_25) ^ (s2_n_419 & s2_n_25); 

//  ND2D1 g12531__1705(.A1 (n_263), .A2 (n_351), .ZN (n_418));  
assign s1_n_418 = ~(s1_n_263 & s1_n_351) ^ (s1_n_263 & s2_n_351); 
assign s2_n_418 = (s2_n_263 & s1_n_351) ^ (s2_n_263 & s2_n_351); 

//  OR2D1 g12446__5122(.A1 (n_325), .A2 (n_416), .Z (n_417));  
assign s1_n_417 = (s2_n_325 | s1_n_416) ^ (s2_n_325 & s2_n_416); 
assign s2_n_417 = (s1_n_325 & s1_n_416) ^ (s1_n_325 | s2_n_416); 

//  NR2XD0 g12484__8246(.A1 (n_299), .A2 (n_304), .ZN (n_415));  
assign s1_n_415 = ~(s2_n_299 | s1_n_304) ^ (s2_n_299 & s2_n_304); 
assign s2_n_415 = (s1_n_299 & s1_n_304) ^ (s1_n_299 | s2_n_304); 

//  NR2D1 g12543__7098(.A1 (n_261), .A2 (n_82), .ZN (n_414));  
assign s1_n_414 = ~(s2_n_261 | s1_n_82) ^ (s2_n_261 & s2_n_82); 
assign s2_n_414 = (s1_n_261 & s1_n_82) ^ (s1_n_261 | s2_n_82); 

//  NR2XD0 g12544__6131(.A1 (n_410), .A2 (n_412), .ZN (n_413));  
assign s1_n_413 = ~(s2_n_410 | s1_n_412) ^ (s2_n_410 & s2_n_412); 
assign s2_n_413 = (s1_n_410 & s1_n_412) ^ (s1_n_410 | s2_n_412); 

//  ND2D1 g12545__1881(.A1 (n_410), .A2 (n_409), .ZN (n_411));  
assign s1_n_411 = ~(s1_n_410 & s1_n_409) ^ (s1_n_410 & s2_n_409); 
assign s2_n_411 = (s2_n_410 & s1_n_409) ^ (s2_n_410 & s2_n_409); 

//  NR2XD0 g12546__5115(.A1 (n_410), .A2 (n_381), .ZN (n_408));  
assign s1_n_408 = ~(s2_n_410 | s1_n_381) ^ (s2_n_410 & s2_n_381); 
assign s2_n_408 = (s1_n_410 & s1_n_381) ^ (s1_n_410 | s2_n_381); 

//  NR2D1 g12547__7482(.A1 (n_405), .A2 (n_412), .ZN (n_407));  
assign s1_n_407 = ~(s2_n_405 | s1_n_412) ^ (s2_n_405 & s2_n_412); 
assign s2_n_407 = (s1_n_405 & s1_n_412) ^ (s1_n_405 | s2_n_412); 

//  ND2D1 g12548__4733(.A1 (n_405), .A2 (n_409), .ZN (n_406));  
assign s1_n_406 = ~(s1_n_405 & s1_n_409) ^ (s1_n_405 & s2_n_409); 
assign s2_n_406 = (s2_n_405 & s1_n_409) ^ (s2_n_405 & s2_n_409); 

//  ND2D1 g12553__6161(.A1 (n_277), .A2 (n_123), .ZN (n_404));  
assign s1_n_404 = ~(s1_n_277 & s1_n_123) ^ (s1_n_277 & s2_n_123); 
assign s2_n_404 = (s2_n_277 & s1_n_123) ^ (s2_n_277 & s2_n_123); 

//  ND2D1 g12555__9315(.A1 (n_265), .A2 (n_90), .ZN (n_403));  
assign s1_n_403 = ~(s1_n_265 & s1_n_90) ^ (s1_n_265 & s2_n_90); 
assign s2_n_403 = (s2_n_265 & s1_n_90) ^ (s2_n_265 & s2_n_90); 

//  NR2D1 g12558__9945(.A1 (n_371), .A2 (n_401), .ZN (n_402));  
assign s1_n_402 = ~(s2_n_371 | s1_n_401) ^ (s2_n_371 & s2_n_401); 
assign s2_n_402 = (s1_n_371 & s1_n_401) ^ (s1_n_371 | s2_n_401); 

//  INVD1 g12624(.I (n_399), .ZN (n_400));  
assign s1_n_400 = ~s1_n_399; 
assign s2_n_400 = s2_n_399; 

//  NR2D1 g12411__2883(.A1 (n_253), .A2 (n_107), .ZN (n_398));  
assign s1_n_398 = ~(s2_n_253 | s1_n_107) ^ (s2_n_253 & s2_n_107); 
assign s2_n_398 = (s1_n_253 & s1_n_107) ^ (s1_n_253 | s2_n_107); 

//  NR2D1 g12425__2346(.A1 (n_252), .A2 (n_396), .ZN (n_397));  
assign s1_n_397 = ~(s2_n_252 | s1_n_396) ^ (s2_n_252 & s2_n_396); 
assign s2_n_397 = (s1_n_252 & s1_n_396) ^ (s1_n_252 | s2_n_396); 

//  ND2D1 g12430__1666(.A1 (n_256), .A2 (n_130), .ZN (n_395));  
assign s1_n_395 = ~(s1_n_256 & s1_n_130) ^ (s1_n_256 & s2_n_130); 
assign s2_n_395 = (s2_n_256 & s1_n_130) ^ (s2_n_256 & s2_n_130); 

//  NR2XD0 g12677__7410(.A1 (n_255), .A2 (n_366), .ZN (n_394));  
assign s1_n_394 = ~(s2_n_255 | s1_n_366) ^ (s2_n_255 & s2_n_366); 
assign s2_n_394 = (s1_n_255 & s1_n_366) ^ (s1_n_255 | s2_n_366); 

//  NR2D1 g12445__6417(.A1 (n_258), .A2 (n_355), .ZN (n_393));  
assign s1_n_393 = ~(s2_n_258 | s1_n_355) ^ (s2_n_258 & s2_n_355); 
assign s2_n_393 = (s1_n_258 & s1_n_355) ^ (s1_n_258 | s2_n_355); 

//  NR2D1 g12473__5477(.A1 (n_275), .A2 (n_98), .ZN (n_392));  
assign s1_n_392 = ~(s2_n_275 | s1_n_98) ^ (s2_n_275 & s2_n_98); 
assign s2_n_392 = (s1_n_275 & s1_n_98) ^ (s1_n_275 | s2_n_98); 

//  NR2D1 g12477__2398(.A1 (n_288), .A2 (n_106), .ZN (n_391));  
assign s1_n_391 = ~(s2_n_288 | s1_n_106) ^ (s2_n_288 & s2_n_106); 
assign s2_n_391 = (s1_n_288 & s1_n_106) ^ (s1_n_288 | s2_n_106); 

//  ND2D1 g12480__5107(.A1 (n_245), .A2 (n_276), .ZN (n_390));  
assign s1_n_390 = ~(s1_n_245 & s1_n_276) ^ (s1_n_245 & s2_n_276); 
assign s2_n_390 = (s2_n_245 & s1_n_276) ^ (s2_n_245 & s2_n_276); 

//  NR2D0 g12482__6260(.A1 (n_307), .A2 (n_379), .ZN (n_389));  
assign s1_n_389 = ~(s2_n_307 | s1_n_379) ^ (s2_n_307 & s2_n_379); 
assign s2_n_389 = (s1_n_307 & s1_n_379) ^ (s1_n_307 | s2_n_379); 

//  ND2D1 g12540__4319(.A1 (n_278), .A2 (n_75), .ZN (n_388));  
assign s1_n_388 = ~(s1_n_278 & s1_n_75) ^ (s1_n_278 & s2_n_75); 
assign s2_n_388 = (s2_n_278 & s1_n_75) ^ (s2_n_278 & s2_n_75); 

//  NR2D1 g12539__8428(.A1 (n_264), .A2 (n_137), .ZN (n_387));  
assign s1_n_387 = ~(s2_n_264 | s1_n_137) ^ (s2_n_264 & s2_n_137); 
assign s2_n_387 = (s1_n_264 & s1_n_137) ^ (s1_n_264 | s2_n_137); 

//  ND2D1 g12488__5526(.A1 (n_385), .A2 (n_129), .ZN (n_386));  
assign s1_n_386 = ~(s1_n_385 & s1_n_129) ^ (s1_n_385 & s2_n_129); 
assign s2_n_386 = (s2_n_385 & s1_n_129) ^ (s2_n_385 & s2_n_129); 

//  ND2D1 g12501__6783(.A1 (n_382), .A2 (n_350), .ZN (n_384));  
assign s1_n_384 = ~(s1_n_382 & s1_n_350) ^ (s1_n_382 & s2_n_350); 
assign s2_n_384 = (s2_n_382 & s1_n_350) ^ (s2_n_382 & s2_n_350); 

//  NR2XD0 g12502__3680(.A1 (n_382), .A2 (n_381), .ZN (n_383));  
assign s1_n_383 = ~(s2_n_382 | s1_n_381) ^ (s2_n_382 & s2_n_381); 
assign s2_n_383 = (s1_n_382 & s1_n_381) ^ (s1_n_382 | s2_n_381); 

//  NR2D0 g12503__1617(.A1 (n_283), .A2 (n_379), .ZN (n_380));  
assign s1_n_380 = ~(s2_n_283 | s1_n_379) ^ (s2_n_283 & s2_n_379); 
assign s2_n_380 = (s1_n_283 & s1_n_379) ^ (s1_n_283 | s2_n_379); 

//  ND2D1 g12505__2802(.A1 (n_260), .A2 (n_59), .ZN (n_378));  
assign s1_n_378 = ~(s1_n_260 & s1_n_59) ^ (s1_n_260 & s2_n_59); 
assign s2_n_378 = (s2_n_260 & s1_n_59) ^ (s2_n_260 & s2_n_59); 

//  ND2D1 g12507__1705(.A1 (n_290), .A2 (n_112), .ZN (n_377));  
assign s1_n_377 = ~(s1_n_290 & s1_n_112) ^ (s1_n_290 & s2_n_112); 
assign s2_n_377 = (s2_n_290 & s1_n_112) ^ (s2_n_290 & s2_n_112); 

//  ND2D1 g12509__5122(.A1 (n_267), .A2 (n_5), .ZN (n_376));  
assign s1_n_376 = ~(s1_n_267 & s1_n_5) ^ (s1_n_267 & s2_n_5); 
assign s2_n_376 = (s2_n_267 & s1_n_5) ^ (s2_n_267 & s2_n_5); 

//  ND2D1 g12510__8246(.A1 (n_272), .A2 (n_300), .ZN (n_375));  
assign s1_n_375 = ~(s1_n_272 & s1_n_300) ^ (s1_n_272 & s2_n_300); 
assign s2_n_375 = (s2_n_272 & s1_n_300) ^ (s2_n_272 & s2_n_300); 

//  ND2D1 g12513__7098(.A1 (n_382), .A2 (n_451), .ZN (n_374));  
assign s1_n_374 = ~(s1_n_382 & s1_n_451) ^ (s1_n_382 & s2_n_451); 
assign s2_n_374 = (s2_n_382 & s1_n_451) ^ (s2_n_382 & s2_n_451); 

//  NR2XD0 g12515__6131(.A1 (n_308), .A2 (n_81), .ZN (n_373));  
assign s1_n_373 = ~(s2_n_308 | s1_n_81) ^ (s2_n_308 & s2_n_81); 
assign s2_n_373 = (s1_n_308 & s1_n_81) ^ (s1_n_308 | s2_n_81); 

//  NR2D0 g12516__1881(.A1 (n_371), .A2 (n_412), .ZN (n_372));  
assign s1_n_372 = ~(s2_n_371 | s1_n_412) ^ (s2_n_371 & s2_n_412); 
assign s2_n_372 = (s1_n_371 & s1_n_412) ^ (s1_n_371 | s2_n_412); 

//  ND2D1 g12519__5115(.A1 (n_284), .A2 (n_23), .ZN (n_370));  
assign s1_n_370 = ~(s1_n_284 & s1_n_23) ^ (s1_n_284 & s2_n_23); 
assign s2_n_370 = (s2_n_284 & s1_n_23) ^ (s2_n_284 & s2_n_23); 

//  ND2D1 g12522__7482(.A1 (n_301), .A2 (n_536), .ZN (n_369));  
assign s1_n_369 = ~(s1_n_301 & s1_n_536) ^ (s1_n_301 & s2_n_536); 
assign s2_n_369 = (s2_n_301 & s1_n_536) ^ (s2_n_301 & s2_n_536); 

//  NR2D1 g12523__4733(.A1 (n_352), .A2 (n_401), .ZN (n_368));  
assign s1_n_368 = ~(s2_n_352 | s1_n_401) ^ (s2_n_352 & s2_n_401); 
assign s2_n_368 = (s1_n_352 & s1_n_401) ^ (s1_n_352 | s2_n_401); 

//  NR2XD0 g12528__6161(.A1 (n_410), .A2 (n_366), .ZN (n_367));  
assign s1_n_367 = ~(s2_n_410 | s1_n_366) ^ (s2_n_410 & s2_n_366); 
assign s2_n_367 = (s1_n_410 & s1_n_366) ^ (s1_n_410 | s2_n_366); 

//  NR2XD0 g12529__9315(.A1 (n_405), .A2 (n_366), .ZN (n_365));  
assign s1_n_365 = ~(s2_n_405 | s1_n_366) ^ (s2_n_405 & s2_n_366); 
assign s2_n_365 = (s1_n_405 & s1_n_366) ^ (s1_n_405 | s2_n_366); 

//  ND2D1 g12530__9945(.A1 (n_410), .A2 (n_451), .ZN (n_364));  
assign s1_n_364 = ~(s1_n_410 & s1_n_451) ^ (s1_n_410 & s2_n_451); 
assign s2_n_364 = (s2_n_410 & s1_n_451) ^ (s2_n_410 & s2_n_451); 

//  NR2XD0 g12535__2883(.A1 (n_297), .A2 (n_366), .ZN (n_363));  
assign s1_n_363 = ~(s2_n_297 | s1_n_366) ^ (s2_n_297 & s2_n_366); 
assign s2_n_363 = (s1_n_297 & s1_n_366) ^ (s1_n_297 | s2_n_366); 

//  NR2D1 g12538__2346(.A1 (n_273), .A2 (n_67), .ZN (n_362));  
assign s1_n_362 = ~(s2_n_273 | s1_n_67) ^ (s2_n_273 & s2_n_67); 
assign s2_n_362 = (s1_n_273 & s1_n_67) ^ (s1_n_273 | s2_n_67); 

//  NR2D1 g12486__1666(.A1 (n_291), .A2 (sbox_in[2]), .ZN (n_361));  
assign s1_n_361 = ~(s2_n_291 | s1_sbox_in[2]) ^ (s2_n_291 & s2_sbox_in[2]); 
assign s2_n_361 = (s1_n_291 & s1_sbox_in[2]) ^ (s1_n_291 | s2_sbox_in[2]); 

//  ND2D1 g12549__7410(.A1 (n_212), .A2 (n_80), .ZN (n_360));  
assign s1_n_360 = ~(s1_n_212 & s1_n_80) ^ (s1_n_212 & s2_n_80); 
assign s2_n_360 = (s2_n_212 & s1_n_80) ^ (s2_n_212 & s2_n_80); 

//  NR2D1 g12550__6417(.A1 (n_207), .A2 (n_195), .ZN (n_359));  
assign s1_n_359 = ~(s2_n_207 | s1_n_195) ^ (s2_n_207 & s2_n_195); 
assign s2_n_359 = (s1_n_207 & s1_n_195) ^ (s1_n_207 | s2_n_195); 

//  NR2XD0 g12551__5477(.A1 (n_356), .A2 (n_412), .ZN (n_358));  
assign s1_n_358 = ~(s2_n_356 | s1_n_412) ^ (s2_n_356 & s2_n_412); 
assign s2_n_358 = (s1_n_356 & s1_n_412) ^ (s1_n_356 | s2_n_412); 

//  AN2XD1 g12552__2398(.A1 (n_356), .A2 (n_355), .Z (n_357));  
assign s1_n_357 = (s1_n_356 & s1_n_355) ^ (s1_n_356 & s2_n_355); 
assign s2_n_357 = (s2_n_356 & s1_n_355) ^ (s2_n_356 & s2_n_355); 

//  ND2D1 g12554__5107(.A1 (n_192), .A2 (n_208), .ZN (n_354));  
assign s1_n_354 = ~(s1_n_192 & s1_n_208) ^ (s1_n_192 & s2_n_208); 
assign s2_n_354 = (s2_n_192 & s1_n_208) ^ (s2_n_192 & s2_n_208); 

//  INVD1 g12560(.I (n_352), .ZN (n_353));  
assign s1_n_353 = ~s1_n_352; 
assign s2_n_353 = s2_n_352; 

//  ND2D1 g12569__6260(.A1 (n_197), .A2 (n_350), .ZN (n_351));  
assign s1_n_351 = ~(s1_n_197 & s1_n_350) ^ (s1_n_197 & s2_n_350); 
assign s2_n_351 = (s2_n_197 & s1_n_350) ^ (s2_n_197 & s2_n_350); 

//  NR2XD0 g12584__4319(.A1 (n_186), .A2 (n_401), .ZN (n_349));  
assign s1_n_349 = ~(s2_n_186 | s1_n_401) ^ (s2_n_186 & s2_n_401); 
assign s2_n_349 = (s1_n_186 & s1_n_401) ^ (s1_n_186 | s2_n_401); 

//  AN2XD1 g12595__8428(.A1 (n_347), .A2 (n_116), .Z (n_348));  
assign s1_n_348 = (s1_n_347 & s1_n_116) ^ (s1_n_347 & s2_n_116); 
assign s2_n_348 = (s2_n_347 & s1_n_116) ^ (s2_n_347 & s2_n_116); 

//  NR2D1 g12597__5526(.A1 (n_201), .A2 (n_27), .ZN (n_346));  
assign s1_n_346 = ~(s2_n_201 | s1_n_27) ^ (s2_n_201 & s2_n_27); 
assign s2_n_346 = (s1_n_201 & s1_n_27) ^ (s1_n_201 | s2_n_27); 

//  ND2D1 g12600__6783(.A1 (n_214), .A2 (n_355), .ZN (n_345));  
assign s1_n_345 = ~(s1_n_214 & s1_n_355) ^ (s1_n_214 & s2_n_355); 
assign s2_n_345 = (s2_n_214 & s1_n_355) ^ (s2_n_214 & s2_n_355); 

//  NR2XD0 g12601__3680(.A1 (n_342), .A2 (n_366), .ZN (n_344));  
assign s1_n_344 = ~(s2_n_342 | s1_n_366) ^ (s2_n_342 & s2_n_366); 
assign s2_n_344 = (s1_n_342 & s1_n_366) ^ (s1_n_342 | s2_n_366); 

//  ND2D1 g12604__1617(.A1 (n_342), .A2 (n_451), .ZN (n_343));  
assign s1_n_343 = ~(s1_n_342 & s1_n_451) ^ (s1_n_342 & s2_n_451); 
assign s2_n_343 = (s2_n_342 & s1_n_451) ^ (s2_n_342 & s2_n_451); 

//  NR2XD0 g12606__2802(.A1 (n_189), .A2 (n_412), .ZN (n_341));  
assign s1_n_341 = ~(s2_n_189 | s1_n_412) ^ (s2_n_189 & s2_n_412); 
assign s2_n_341 = (s1_n_189 & s1_n_412) ^ (s1_n_189 | s2_n_412); 

//  ND2D1 g12671__1705(.A1 (n_333), .A2 (n_409), .ZN (n_340));  
assign s1_n_340 = ~(s1_n_333 & s1_n_409) ^ (s1_n_333 & s2_n_409); 
assign s2_n_340 = (s2_n_333 & s1_n_409) ^ (s2_n_333 & s2_n_409); 

//  NR2XD0 g12649__5122(.A1 (n_183), .A2 (n_401), .ZN (n_339));  
assign s1_n_339 = ~(s2_n_183 | s1_n_401) ^ (s2_n_183 & s2_n_401); 
assign s2_n_339 = (s1_n_183 & s1_n_401) ^ (s1_n_183 | s2_n_401); 

//  ND2D1 g12647__8246(.A1 (n_336), .A2 (n_350), .ZN (n_338));  
assign s1_n_338 = ~(s1_n_336 & s1_n_350) ^ (s1_n_336 & s2_n_350); 
assign s2_n_338 = (s2_n_336 & s1_n_350) ^ (s2_n_336 & s2_n_350); 

//  ND2D1 g12646__7098(.A1 (n_336), .A2 (n_409), .ZN (n_337));  
assign s1_n_337 = ~(s1_n_336 & s1_n_409) ^ (s1_n_336 & s2_n_409); 
assign s2_n_337 = (s2_n_336 & s1_n_409) ^ (s2_n_336 & s2_n_409); 

//  NR2XD0 g12640__6131(.A1 (n_254), .A2 (n_401), .ZN (n_335));  
assign s1_n_335 = ~(s2_n_254 | s1_n_401) ^ (s2_n_254 & s2_n_401); 
assign s2_n_335 = (s1_n_254 & s1_n_401) ^ (s1_n_254 | s2_n_401); 

//  ND2D1 g12644__1881(.A1 (n_187), .A2 (n_350), .ZN (n_334));  
assign s1_n_334 = ~(s1_n_187 & s1_n_350) ^ (s1_n_187 & s2_n_350); 
assign s2_n_334 = (s2_n_187 & s1_n_350) ^ (s2_n_187 & s2_n_350); 

//  NR2XD0 g12612__5115(.A1 (n_333), .A2 (n_296), .ZN (n_422));  
assign s1_n_422 = ~(s2_n_333 | s1_n_296) ^ (s2_n_333 & s2_n_296); 
assign s2_n_422 = (s1_n_333 & s1_n_296) ^ (s1_n_333 | s2_n_296); 

//  NR2D1 g12611__7482(.A1 (n_49), .A2 (n_184), .ZN (n_502));  
assign s1_n_502 = ~(s2_n_49 | s1_n_184) ^ (s2_n_49 & s2_n_184); 
assign s2_n_502 = (s1_n_49 & s1_n_184) ^ (s1_n_49 | s2_n_184); 

//  NR2D0 g12619__4733(.A1 (n_333), .A2 (n_52), .ZN (n_427));  
assign s1_n_427 = ~(s2_n_333 | s1_n_52) ^ (s2_n_333 & s2_n_52); 
assign s2_n_427 = (s1_n_333 & s1_n_52) ^ (s1_n_333 | s2_n_52); 

//  NR2XD0 g12618__6161(.A1 (n_191), .A2 (n_401), .ZN (n_592));  
assign s1_n_592 = ~(s2_n_191 | s1_n_401) ^ (s2_n_191 & s2_n_401); 
assign s2_n_592 = (s1_n_191 & s1_n_401) ^ (s1_n_191 | s2_n_401); 

//  ND2D1 g12537__9315(.A1 (n_356), .A2 (n_350), .ZN (n_332));  
assign s1_n_332 = ~(s1_n_356 & s1_n_350) ^ (s1_n_356 & s2_n_350); 
assign s2_n_332 = (s2_n_356 & s1_n_350) ^ (s2_n_356 & s2_n_350); 

//  NR2D1 g12475__9945(.A1 (n_162), .A2 (n_230), .ZN (n_331));  
assign s1_n_331 = ~(s2_n_162 | s1_n_230) ^ (s2_n_162 & s2_n_230); 
assign s2_n_331 = (s1_n_162 & s1_n_230) ^ (s1_n_162 | s2_n_230); 

//  NR2D0 g12485__2883(.A1 (n_356), .A2 (sbox_in[2]), .ZN (n_330));  
assign s1_n_330 = ~(s2_n_356 | s1_sbox_in[2]) ^ (s2_n_356 & s2_sbox_in[2]); 
assign s2_n_330 = (s1_n_356 & s1_sbox_in[2]) ^ (s1_n_356 | s2_sbox_in[2]); 

//  ND2D1 g12489__2346(.A1 (n_204), .A2 (n_165), .ZN (n_329));  
assign s1_n_329 = ~(s1_n_204 & s1_n_165) ^ (s1_n_204 & s2_n_165); 
assign s2_n_329 = (s2_n_204 & s1_n_165) ^ (s2_n_204 & s2_n_165); 

//  ND2D1 g12490__1666(.A1 (n_242), .A2 (n_355), .ZN (n_328));  
assign s1_n_328 = ~(s1_n_242 & s1_n_355) ^ (s1_n_242 & s2_n_355); 
assign s2_n_328 = (s2_n_242 & s1_n_355) ^ (s2_n_242 & s2_n_355); 

//  ND2D1 g12493__7410(.A1 (n_231), .A2 (n_31), .ZN (n_327));  
assign s1_n_327 = ~(s1_n_231 & s1_n_31) ^ (s1_n_231 & s2_n_31); 
assign s2_n_327 = (s2_n_231 & s1_n_31) ^ (s2_n_231 & s2_n_31); 

//  NR2D1 g12495__6417(.A1 (n_211), .A2 (n_169), .ZN (n_326));  
assign s1_n_326 = ~(s2_n_211 | s1_n_169) ^ (s2_n_211 & s2_n_169); 
assign s2_n_326 = (s1_n_211 & s1_n_169) ^ (s1_n_211 | s2_n_169); 

//  ND2D1 g12496__5477(.A1 (n_220), .A2 (n_241), .ZN (n_325));  
assign s1_n_325 = ~(s1_n_220 & s1_n_241) ^ (s1_n_220 & s2_n_241); 
assign s2_n_325 = (s2_n_220 & s1_n_241) ^ (s2_n_220 & s2_n_241); 

//  ND2D1 g12497__2398(.A1 (n_226), .A2 (n_240), .ZN (n_324));  
assign s1_n_324 = ~(s1_n_226 & s1_n_240) ^ (s1_n_226 & s2_n_240); 
assign s2_n_324 = (s2_n_226 & s1_n_240) ^ (s2_n_226 & s2_n_240); 

//  NR2D1 g12498__5107(.A1 (n_250), .A2 (n_51), .ZN (n_323));  
assign s1_n_323 = ~(s2_n_250 | s1_n_51) ^ (s2_n_250 & s2_n_51); 
assign s2_n_323 = (s1_n_250 & s1_n_51) ^ (s1_n_250 | s2_n_51); 

//  ND2D1 g12500__6260(.A1 (n_227), .A2 (n_121), .ZN (n_322));  
assign s1_n_322 = ~(s1_n_227 & s1_n_121) ^ (s1_n_227 & s2_n_121); 
assign s2_n_322 = (s2_n_227 & s1_n_121) ^ (s2_n_227 & s2_n_121); 

//  ND2D1 g12504__4319(.A1 (n_317), .A2 (n_451), .ZN (n_321));  
assign s1_n_321 = ~(s1_n_317 & s1_n_451) ^ (s1_n_317 & s2_n_451); 
assign s2_n_321 = (s2_n_317 & s1_n_451) ^ (s2_n_317 & s2_n_451); 

//  ND2D1 g12511__8428(.A1 (n_229), .A2 (n_228), .ZN (n_320));  
assign s1_n_320 = ~(s1_n_229 & s1_n_228) ^ (s1_n_229 & s2_n_228); 
assign s2_n_320 = (s2_n_229 & s1_n_228) ^ (s2_n_229 & s2_n_228); 

//  ND2D1 g12514__5526(.A1 (n_217), .A2 (n_29), .ZN (n_319));  
assign s1_n_319 = ~(s1_n_217 & s1_n_29) ^ (s1_n_217 & s2_n_29); 
assign s2_n_319 = (s2_n_217 & s1_n_29) ^ (s2_n_217 & s2_n_29); 

//  ND2D1 g12517__6783(.A1 (n_317), .A2 (n_350), .ZN (n_318));  
assign s1_n_318 = ~(s1_n_317 & s1_n_350) ^ (s1_n_317 & s2_n_350); 
assign s2_n_318 = (s2_n_317 & s1_n_350) ^ (s2_n_317 & s2_n_350); 

//  ND2D1 g12525__3680(.A1 (n_314), .A2 (n_350), .ZN (n_316));  
assign s1_n_316 = ~(s1_n_314 & s1_n_350) ^ (s1_n_314 & s2_n_350); 
assign s2_n_316 = (s2_n_314 & s1_n_350) ^ (s2_n_314 & s2_n_350); 

//  ND2D1 g12526__1617(.A1 (n_314), .A2 (n_409), .ZN (n_315));  
assign s1_n_315 = ~(s1_n_314 & s1_n_409) ^ (s1_n_314 & s2_n_409); 
assign s2_n_315 = (s2_n_314 & s1_n_409) ^ (s2_n_314 & s2_n_409); 

//  NR2XD0 g12532__2802(.A1 (n_311), .A2 (n_401), .ZN (n_313));  
assign s1_n_313 = ~(s2_n_311 | s1_n_401) ^ (s2_n_311 & s2_n_401); 
assign s2_n_313 = (s1_n_311 & s1_n_401) ^ (s1_n_311 | s2_n_401); 

//  ND2D1 g12533__1705(.A1 (n_311), .A2 (n_355), .ZN (n_312));  
assign s1_n_312 = ~(s1_n_311 & s1_n_355) ^ (s1_n_311 & s2_n_355); 
assign s2_n_312 = (s2_n_311 & s1_n_355) ^ (s2_n_311 & s2_n_355); 

//  NR2D1 g12536__5122(.A1 (n_234), .A2 (n_366), .ZN (n_310));  
assign s1_n_310 = ~(s2_n_234 | s1_n_366) ^ (s2_n_234 & s2_n_366); 
assign s2_n_310 = (s1_n_234 & s1_n_366) ^ (s1_n_234 | s2_n_366); 

//  NR2D1 g12474__8246(.A1 (n_236), .A2 (n_243), .ZN (n_309));  
assign s1_n_309 = ~(s2_n_236 | s1_n_243) ^ (s2_n_236 & s2_n_243); 
assign s2_n_309 = (s1_n_236 & s1_n_243) ^ (s1_n_236 | s2_n_243); 

//  ND2D1 g12678__7098(.A1 (n_194), .A2 (n_409), .ZN (n_419));  
assign s1_n_419 = ~(s1_n_194 & s1_n_409) ^ (s1_n_194 & s2_n_409); 
assign s2_n_419 = (s2_n_194 & s1_n_409) ^ (s2_n_194 & s2_n_409); 

//  NR2XD0 g12682__6131(.A1 (n_333), .A2 (n_181), .ZN (n_399));  
assign s1_n_399 = ~(s2_n_333 | s1_n_181) ^ (s2_n_333 & s2_n_181); 
assign s2_n_399 = (s1_n_333 & s1_n_181) ^ (s1_n_333 | s2_n_181); 

//  AN2XD1 g12685__1881(.A1 (n_342), .A2 (n_350), .Z (n_438));  
assign s1_n_438 = (s1_n_342 & s1_n_350) ^ (s1_n_342 & s2_n_350); 
assign s2_n_438 = (s2_n_342 & s1_n_350) ^ (s2_n_342 & s2_n_350); 

//  NR2XD0 g12607__5115(.A1 (n_188), .A2 (n_412), .ZN (n_308));  
assign s1_n_308 = ~(s2_n_188 | s1_n_412) ^ (s2_n_188 & s2_n_412); 
assign s2_n_308 = (s1_n_188 & s1_n_412) ^ (s1_n_188 | s2_n_412); 

//  ND2D1 g12563__7482(.A1 (n_126), .A2 (n_142), .ZN (n_307));  
assign s1_n_307 = ~(s1_n_126 & s1_n_142) ^ (s1_n_126 & s2_n_142); 
assign s2_n_307 = (s2_n_126 & s1_n_142) ^ (s2_n_126 & s2_n_142); 

//  NR2XD0 g12564__4733(.A1 (n_302), .A2 (n_73), .ZN (n_306));  
assign s1_n_306 = ~(s2_n_302 | s1_n_73) ^ (s2_n_302 & s2_n_73); 
assign s2_n_306 = (s1_n_302 & s1_n_73) ^ (s1_n_302 | s2_n_73); 

//  NR2D1 g12571__6161(.A1 (n_127), .A2 (n_304), .ZN (n_305));  
assign s1_n_305 = ~(s2_n_127 | s1_n_304) ^ (s2_n_127 & s2_n_304); 
assign s2_n_305 = (s1_n_127 & s1_n_304) ^ (s1_n_127 | s2_n_304); 

//  NR2D1 g12579__9315(.A1 (n_302), .A2 (n_381), .ZN (n_303));  
assign s1_n_303 = ~(s2_n_302 | s1_n_381) ^ (s2_n_302 & s2_n_381); 
assign s2_n_303 = (s1_n_302 & s1_n_381) ^ (s1_n_302 | s2_n_381); 

//  NR2XD0 g12580__9945(.A1 (n_160), .A2 (n_44), .ZN (n_301));  
assign s1_n_301 = ~(s2_n_160 | s1_n_44) ^ (s2_n_160 & s2_n_44); 
assign s2_n_301 = (s1_n_160 & s1_n_44) ^ (s1_n_160 | s2_n_44); 

//  ND2D1 g12587__2883(.A1 (n_270), .A2 (n_350), .ZN (n_300));  
assign s1_n_300 = ~(s1_n_270 & s1_n_350) ^ (s1_n_270 & s2_n_350); 
assign s2_n_300 = (s2_n_270 & s1_n_350) ^ (s2_n_270 & s2_n_350); 

//  NR2XD0 g12588__2346(.A1 (n_280), .A2 (n_118), .ZN (n_299));  
assign s1_n_299 = ~(s2_n_280 | s1_n_118) ^ (s2_n_280 & s2_n_118); 
assign s2_n_299 = (s1_n_280 & s1_n_118) ^ (s1_n_280 | s2_n_118); 

//  NR2XD0 g12589__1666(.A1 (n_190), .A2 (n_381), .ZN (n_298));  
assign s1_n_298 = ~(s2_n_190 | s1_n_381) ^ (s2_n_190 & s2_n_381); 
assign s2_n_298 = (s1_n_190 & s1_n_381) ^ (s1_n_190 | s2_n_381); 

//  NR2XD0 g12593__7410(.A1 (n_286), .A2 (n_296), .ZN (n_297));  
assign s1_n_297 = ~(s2_n_286 | s1_n_296) ^ (s2_n_286 & s2_n_296); 
assign s2_n_297 = (s1_n_286 & s1_n_296) ^ (s1_n_286 | s2_n_296); 

//  NR2D1 g12598__6417(.A1 (n_293), .A2 (n_401), .ZN (n_295));  
assign s1_n_295 = ~(s2_n_293 | s1_n_401) ^ (s2_n_293 & s2_n_401); 
assign s2_n_295 = (s1_n_293 & s1_n_401) ^ (s1_n_293 | s2_n_401); 

//  ND2D1 g12599__5477(.A1 (n_293), .A2 (n_355), .ZN (n_294));  
assign s1_n_294 = ~(s1_n_293 & s1_n_355) ^ (s1_n_293 & s2_n_355); 
assign s2_n_294 = (s2_n_293 & s1_n_355) ^ (s2_n_293 & s2_n_355); 

//  ND2D1 g12602__2398(.A1 (n_141), .A2 (n_409), .ZN (n_292));  
assign s1_n_292 = ~(s1_n_141 & s1_n_409) ^ (s1_n_141 & s2_n_409); 
assign s2_n_292 = (s2_n_141 & s1_n_409) ^ (s2_n_141 & s2_n_409); 

//  INVD1 g12561(.I (n_317), .ZN (n_291));  
assign s1_n_291 = ~s1_n_317; 
assign s2_n_291 = s2_n_317; 

//  ND2D1 g12637__5107(.A1 (n_164), .A2 (n_355), .ZN (n_290));  
assign s1_n_290 = ~(s1_n_164 & s1_n_355) ^ (s1_n_164 & s2_n_355); 
assign s2_n_290 = (s2_n_164 & s1_n_355) ^ (s2_n_164 & s2_n_355); 

//  ND2D1 g12636__6260(.A1 (n_156), .A2 (n_409), .ZN (n_289));  
assign s1_n_289 = ~(s1_n_156 & s1_n_409) ^ (s1_n_156 & s2_n_409); 
assign s2_n_289 = (s2_n_156 & s1_n_409) ^ (s2_n_156 & s2_n_409); 

//  ND2D1 g12634__4319(.A1 (n_134), .A2 (n_11), .ZN (n_288));  
assign s1_n_288 = ~(s1_n_134 & s1_n_11) ^ (s1_n_134 & s2_n_11); 
assign s2_n_288 = (s2_n_134 & s1_n_11) ^ (s2_n_134 & s2_n_11); 

//  ND2D1 g12629__8428(.A1 (n_286), .A2 (n_350), .ZN (n_287));  
assign s1_n_287 = ~(s1_n_286 & s1_n_350) ^ (s1_n_286 & s2_n_350); 
assign s2_n_287 = (s2_n_286 & s1_n_350) ^ (s2_n_286 & s2_n_350); 

//  ND2D1 g12628__5526(.A1 (n_282), .A2 (n_350), .ZN (n_285));  
assign s1_n_285 = ~(s1_n_282 & s1_n_350) ^ (s1_n_282 & s2_n_350); 
assign s2_n_285 = (s2_n_282 & s1_n_350) ^ (s2_n_282 & s2_n_350); 

//  ND2D1 g12626__6783(.A1 (n_259), .A2 (n_355), .ZN (n_284));  
assign s1_n_284 = ~(s1_n_259 & s1_n_355) ^ (s1_n_259 & s2_n_355); 
assign s2_n_284 = (s2_n_259 & s1_n_355) ^ (s2_n_259 & s2_n_355); 

//  NR2D1 g12627__3680(.A1 (n_282), .A2 (n_381), .ZN (n_283));  
assign s1_n_283 = ~(s2_n_282 | s1_n_381) ^ (s2_n_282 & s2_n_381); 
assign s2_n_283 = (s1_n_282 & s1_n_381) ^ (s1_n_282 | s2_n_381); 

//  ND2D1 g12615__1617(.A1 (n_213), .A2 (n_350), .ZN (n_385));  
assign s1_n_385 = ~(s1_n_213 & s1_n_350) ^ (s1_n_213 & s2_n_350); 
assign s2_n_385 = (s2_n_213 & s1_n_350) ^ (s2_n_213 & s2_n_350); 

//  INVD1 g12625(.I (n_281), .ZN (n_568));  
assign s1_n_568 = ~s1_n_281; 
assign s2_n_568 = s2_n_281; 

//  ND2D1 g12617__2802(.A1 (n_279), .A2 (n_39), .ZN (n_352));  
assign s1_n_352 = ~(s1_n_279 & s1_n_39) ^ (s1_n_279 & s2_n_39); 
assign s2_n_352 = (s2_n_279 & s1_n_39) ^ (s2_n_279 & s2_n_39); 

//  NR2XD0 g12620__1705(.A1 (n_280), .A2 (n_115), .ZN (n_382));  
assign s1_n_382 = ~(s2_n_280 | s1_n_115) ^ (s2_n_280 & s2_n_115); 
assign s2_n_382 = (s1_n_280 & s1_n_115) ^ (s1_n_280 | s2_n_115); 

//  ND2D1 g12623__5122(.A1 (n_279), .A2 (n_114), .ZN (n_410));  
assign s1_n_410 = ~(s1_n_279 & s1_n_114) ^ (s1_n_279 & s2_n_114); 
assign s2_n_410 = (s2_n_279 & s1_n_114) ^ (s2_n_279 & s2_n_114); 

//  ND2D1 g12667__8246(.A1 (n_193), .A2 (n_350), .ZN (n_278));  
assign s1_n_278 = ~(s1_n_193 & s1_n_350) ^ (s1_n_193 & s2_n_350); 
assign s2_n_278 = (s2_n_193 & s1_n_350) ^ (s2_n_193 & s2_n_350); 

//  ND2D1 g12641__7098(.A1 (n_262), .A2 (n_350), .ZN (n_277));  
assign s1_n_277 = ~(s1_n_262 & s1_n_350) ^ (s1_n_262 & s2_n_350); 
assign s2_n_277 = (s2_n_262 & s1_n_350) ^ (s2_n_262 & s2_n_350); 

//  ND2D1 g12642__6131(.A1 (n_274), .A2 (n_409), .ZN (n_276));  
assign s1_n_276 = ~(s1_n_274 & s1_n_409) ^ (s1_n_274 & s2_n_409); 
assign s2_n_276 = (s2_n_274 & s1_n_409) ^ (s2_n_274 & s2_n_409); 

//  NR2XD0 g12643__1881(.A1 (n_274), .A2 (n_412), .ZN (n_275));  
assign s1_n_275 = ~(s2_n_274 | s1_n_412) ^ (s2_n_274 & s2_n_412); 
assign s2_n_275 = (s1_n_274 & s1_n_412) ^ (s1_n_274 | s2_n_412); 

//  NR2XD0 g12645__5115(.A1 (n_140), .A2 (n_381), .ZN (n_273));  
assign s1_n_273 = ~(s2_n_140 | s1_n_381) ^ (s2_n_140 & s2_n_381); 
assign s2_n_273 = (s1_n_140 & s1_n_381) ^ (s1_n_140 | s2_n_381); 

//  ND2D1 g12648__7482(.A1 (n_179), .A2 (n_451), .ZN (n_272));  
assign s1_n_272 = ~(s1_n_179 & s1_n_451) ^ (s1_n_179 & s2_n_451); 
assign s2_n_272 = (s2_n_179 & s1_n_451) ^ (s2_n_179 & s2_n_451); 

//  AN2XD1 g12651__4733(.A1 (n_270), .A2 (n_451), .Z (n_271));  
assign s1_n_271 = (s1_n_270 & s1_n_451) ^ (s1_n_270 & s2_n_451); 
assign s2_n_271 = (s2_n_270 & s1_n_451) ^ (s2_n_270 & s2_n_451); 

//  ND2D1 g12652__6161(.A1 (n_174), .A2 (n_355), .ZN (n_269));  
assign s1_n_269 = ~(s1_n_174 & s1_n_355) ^ (s1_n_174 & s2_n_355); 
assign s2_n_269 = (s2_n_174 & s1_n_355) ^ (s2_n_174 & s2_n_355); 

//  ND2D1 g12654__9315(.A1 (n_280), .A2 (n_409), .ZN (n_268));  
assign s1_n_268 = ~(s1_n_280 & s1_n_409) ^ (s1_n_280 & s2_n_409); 
assign s2_n_268 = (s2_n_280 & s1_n_409) ^ (s2_n_280 & s2_n_409); 

//  ND2D1 g12655__9945(.A1 (n_280), .A2 (n_451), .ZN (n_267));  
assign s1_n_267 = ~(s1_n_280 & s1_n_451) ^ (s1_n_280 & s2_n_451); 
assign s2_n_267 = (s2_n_280 & s1_n_451) ^ (s2_n_280 & s2_n_451); 

//  NR2D0 g12657__2883(.A1 (n_286), .A2 (n_366), .ZN (n_266));  
assign s1_n_266 = ~(s2_n_286 | s1_n_366) ^ (s2_n_286 & s2_n_366); 
assign s2_n_266 = (s1_n_286 & s1_n_366) ^ (s1_n_286 | s2_n_366); 

//  ND2D1 g12661__2346(.A1 (n_149), .A2 (n_451), .ZN (n_265));  
assign s1_n_265 = ~(s1_n_149 & s1_n_451) ^ (s1_n_149 & s2_n_451); 
assign s2_n_265 = (s2_n_149 & s1_n_451) ^ (s2_n_149 & s2_n_451); 

//  NR2D1 g12662__1666(.A1 (n_147), .A2 (n_401), .ZN (n_264));  
assign s1_n_264 = ~(s2_n_147 | s1_n_401) ^ (s2_n_147 & s2_n_401); 
assign s2_n_264 = (s1_n_147 & s1_n_401) ^ (s1_n_147 | s2_n_401); 

//  ND2D1 g12639__7410(.A1 (n_262), .A2 (n_355), .ZN (n_263));  
assign s1_n_263 = ~(s1_n_262 & s1_n_355) ^ (s1_n_262 & s2_n_355); 
assign s2_n_263 = (s2_n_262 & s1_n_355) ^ (s2_n_262 & s2_n_355); 

//  ND2D1 g12669__6417(.A1 (n_138), .A2 (n_78), .ZN (n_261));  
assign s1_n_261 = ~(s1_n_138 & s1_n_78) ^ (s1_n_138 & s2_n_78); 
assign s2_n_261 = (s2_n_138 & s1_n_78) ^ (s2_n_138 & s2_n_78); 

//  ND2D1 g12670__5477(.A1 (n_259), .A2 (n_350), .ZN (n_260));  
assign s1_n_260 = ~(s1_n_259 & s1_n_350) ^ (s1_n_259 & s2_n_350); 
assign s2_n_260 = (s2_n_259 & s1_n_350) ^ (s2_n_259 & s2_n_350); 

//  ND2D1 g12499__2398(.A1 (n_168), .A2 (n_108), .ZN (n_258));  
assign s1_n_258 = ~(s1_n_168 & s1_n_108) ^ (s1_n_168 & s2_n_108); 
assign s2_n_258 = (s2_n_168 & s1_n_108) ^ (s2_n_168 & s2_n_108); 

//  NR2D1 g12494__5107(.A1 (n_172), .A2 (n_629), .ZN (n_257));  
assign s1_n_257 = ~(s2_n_172 | s1_n_629) ^ (s2_n_172 & s2_n_629); 
assign s2_n_257 = (s1_n_172 & s1_n_629) ^ (s1_n_172 | s2_n_629); 

//  NR2D1 g12491__6260(.A1 (n_166), .A2 (n_150), .ZN (n_256));  
assign s1_n_256 = ~(s2_n_166 | s1_n_150) ^ (s2_n_166 & s2_n_150); 
assign s2_n_256 = (s1_n_166 & s1_n_150) ^ (s1_n_166 | s2_n_150); 

//  INVD1 g12755(.I (n_254), .ZN (n_255));  
assign s1_n_255 = ~s1_n_254; 
assign s2_n_255 = s2_n_254; 

//  ND2D1 g12476__4319(.A1 (n_152), .A2 (n_154), .ZN (n_253));  
assign s1_n_253 = ~(s1_n_152 & s1_n_154) ^ (s1_n_152 & s2_n_154); 
assign s2_n_253 = (s2_n_152 & s1_n_154) ^ (s2_n_152 & s2_n_154); 

//  NR2XD0 g12481__8428(.A1 (n_171), .A2 (n_94), .ZN (n_252));  
assign s1_n_252 = ~(s2_n_171 | s1_n_94) ^ (s2_n_171 & s2_n_94); 
assign s2_n_252 = (s1_n_171 & s1_n_94) ^ (s1_n_171 | s2_n_94); 

//  NR2D1 g12483__5526(.A1 (n_170), .A2 (n_83), .ZN (n_251));  
assign s1_n_251 = ~(s2_n_170 | s1_n_83) ^ (s2_n_170 & s2_n_83); 
assign s2_n_251 = (s1_n_170 & s1_n_83) ^ (s1_n_170 | s2_n_83); 

//  NR2XD0 g12684__6783(.A1 (n_262), .A2 (n_381), .ZN (n_484));  
assign s1_n_484 = ~(s2_n_262 | s1_n_381) ^ (s2_n_262 & s2_n_381); 
assign s2_n_484 = (s1_n_262 & s1_n_381) ^ (s1_n_262 | s2_n_381); 

//  NR2XD0 g12680__3680(.A1 (n_286), .A2 (n_139), .ZN (n_371));  
assign s1_n_371 = ~(s2_n_286 | s1_n_139) ^ (s2_n_286 & s2_n_139); 
assign s2_n_371 = (s1_n_286 & s1_n_139) ^ (s1_n_286 | s2_n_139); 

//  NR2XD0 g12687__1617(.A1 (n_280), .A2 (n_92), .ZN (n_405));  
assign s1_n_405 = ~(s2_n_280 | s1_n_92) ^ (s2_n_280 & s2_n_92); 
assign s2_n_405 = (s1_n_280 & s1_n_92) ^ (s1_n_280 | s2_n_92); 

//  NR2D1 g12605__2802(.A1 (n_247), .A2 (n_366), .ZN (n_250));  
assign s1_n_250 = ~(s2_n_247 | s1_n_366) ^ (s2_n_247 & s2_n_366); 
assign s2_n_250 = (s1_n_247 & s1_n_366) ^ (s1_n_247 | s2_n_366); 

//  ND2D1 g12566__1705(.A1 (n_233), .A2 (sbox_in[7]), .ZN (n_249));  
assign s1_n_249 = ~(s1_n_233 & s1_sbox_in[7]) ^ (s1_n_233 & s2_sbox_in[7]); 
assign s2_n_249 = (s2_n_233 & s1_sbox_in[7]) ^ (s2_n_233 & s2_sbox_in[7]); 

//  AN2XD1 g12567__5122(.A1 (n_247), .A2 (n_246), .Z (n_248));  
assign s1_n_248 = (s1_n_247 & s1_n_246) ^ (s1_n_247 & s2_n_246); 
assign s2_n_248 = (s2_n_247 & s1_n_246) ^ (s2_n_247 & s2_n_246); 

//  NR2XD0 g12568__8246(.A1 (n_76), .A2 (n_13), .ZN (n_245));  
assign s1_n_245 = ~(s2_n_76 | s1_n_13) ^ (s2_n_76 & s2_n_13); 
assign s2_n_245 = (s1_n_76 & s1_n_13) ^ (s1_n_76 | s2_n_13); 

//  NR2D1 g12574__7098(.A1 (n_95), .A2 (n_396), .ZN (n_244));  
assign s1_n_244 = ~(s2_n_95 | s1_n_396) ^ (s2_n_95 & s2_n_396); 
assign s2_n_244 = (s1_n_95 & s1_n_396) ^ (s1_n_95 | s2_n_396); 

//  NR2XD0 g12575__6131(.A1 (n_101), .A2 (n_401), .ZN (n_243));  
assign s1_n_243 = ~(s2_n_101 | s1_n_401) ^ (s2_n_101 & s2_n_401); 
assign s2_n_243 = (s1_n_101 & s1_n_401) ^ (s1_n_101 | s2_n_401); 

//  ND2D1 g12576__1881(.A1 (n_215), .A2 (n_64), .ZN (n_242));  
assign s1_n_242 = ~(s1_n_215 & s1_n_64) ^ (s1_n_215 & s2_n_64); 
assign s2_n_242 = (s2_n_215 & s1_n_64) ^ (s2_n_215 & s2_n_64); 

//  ND2D1 g12581__5115(.A1 (n_239), .A2 (n_409), .ZN (n_241));  
assign s1_n_241 = ~(s1_n_239 & s1_n_409) ^ (s1_n_239 & s2_n_409); 
assign s2_n_241 = (s2_n_239 & s1_n_409) ^ (s2_n_239 & s2_n_409); 

//  ND2D1 g12582__7482(.A1 (n_239), .A2 (n_355), .ZN (n_240));  
assign s1_n_240 = ~(s1_n_239 & s1_n_355) ^ (s1_n_239 & s2_n_355); 
assign s2_n_240 = (s2_n_239 & s1_n_355) ^ (s2_n_239 & s2_n_355); 

//  NR2D1 g12585__4733(.A1 (n_77), .A2 (n_45), .ZN (n_238));  
assign s1_n_238 = ~(s2_n_77 | s1_n_45) ^ (s2_n_77 & s2_n_45); 
assign s2_n_238 = (s1_n_77 & s1_n_45) ^ (s1_n_77 | s2_n_45); 

//  NR2XD0 g12586__6161(.A1 (n_225), .A2 (n_381), .ZN (n_237));  
assign s1_n_237 = ~(s2_n_225 | s1_n_381) ^ (s2_n_225 & s2_n_381); 
assign s2_n_237 = (s1_n_225 & s1_n_381) ^ (s1_n_225 | s2_n_381); 

//  NR2D0 g12590__9315(.A1 (n_247), .A2 (n_381), .ZN (n_236));  
assign s1_n_236 = ~(s2_n_247 | s1_n_381) ^ (s2_n_247 & s2_n_381); 
assign s2_n_236 = (s1_n_247 & s1_n_381) ^ (s1_n_247 | s2_n_381); 

//  ND2D1 g12592__9945(.A1 (n_99), .A2 (n_355), .ZN (n_235));  
assign s1_n_235 = ~(s1_n_99 & s1_n_355) ^ (s1_n_99 & s2_n_355); 
assign s2_n_235 = (s2_n_99 & s1_n_355) ^ (s2_n_99 & s2_n_355); 

//  NR2XD0 g12594__2883(.A1 (n_233), .A2 (n_109), .ZN (n_234));  
assign s1_n_234 = ~(s2_n_233 | s1_n_109) ^ (s2_n_233 & s2_n_109); 
assign s2_n_234 = (s1_n_233 & s1_n_109) ^ (s1_n_233 | s2_n_109); 

//  ND2D1 g12596__2346(.A1 (n_218), .A2 (n_350), .ZN (n_232));  
assign s1_n_232 = ~(s1_n_218 & s1_n_350) ^ (s1_n_218 & s2_n_350); 
assign s2_n_232 = (s2_n_218 & s1_n_350) ^ (s2_n_218 & s2_n_350); 

//  ND2D1 g12603__1666(.A1 (n_221), .A2 (n_350), .ZN (n_231));  
assign s1_n_231 = ~(s1_n_221 & s1_n_350) ^ (s1_n_221 & s2_n_350); 
assign s2_n_231 = (s2_n_221 & s1_n_350) ^ (s2_n_221 & s2_n_350); 

//  ND2D1 g12565__7410(.A1 (n_88), .A2 (n_16), .ZN (n_230));  
assign s1_n_230 = ~(s1_n_88 & s1_n_16) ^ (s1_n_88 & s2_n_16); 
assign s2_n_230 = (s2_n_88 & s1_n_16) ^ (s2_n_88 & s2_n_16); 

//  ND2D1 g12608__6417(.A1 (n_247), .A2 (n_409), .ZN (n_229));  
assign s1_n_229 = ~(s1_n_247 & s1_n_409) ^ (s1_n_247 & s2_n_409); 
assign s2_n_229 = (s2_n_247 & s1_n_409) ^ (s2_n_247 & s2_n_409); 

//  ND2D1 g12656__5477(.A1 (n_216), .A2 (n_355), .ZN (n_228));  
assign s1_n_228 = ~(s1_n_216 & s1_n_355) ^ (s1_n_216 & s2_n_355); 
assign s2_n_228 = (s2_n_216 & s1_n_355) ^ (s2_n_216 & s2_n_355); 

//  ND2D1 g12653__2398(.A1 (n_233), .A2 (n_355), .ZN (n_227));  
assign s1_n_227 = ~(s1_n_233 & s1_n_355) ^ (s1_n_233 & s2_n_355); 
assign s2_n_227 = (s2_n_233 & s1_n_355) ^ (s2_n_233 & s2_n_355); 

//  OR2XD1 g12650__5107(.A1 (n_225), .A2 (n_401), .Z (n_226));  
assign s1_n_226 = (s2_n_225 | s1_n_401) ^ (s2_n_225 & s2_n_401); 
assign s2_n_226 = (s1_n_225 & s1_n_401) ^ (s1_n_225 | s2_n_401); 

//  ND2D1 g12638__6260(.A1 (n_163), .A2 (n_355), .ZN (n_224));  
assign s1_n_224 = ~(s1_n_163 & s1_n_355) ^ (s1_n_163 & s2_n_355); 
assign s2_n_224 = (s2_n_163 & s1_n_355) ^ (s2_n_163 & s2_n_355); 

//  NR2D0 g12635__4319(.A1 (n_155), .A2 (n_381), .ZN (n_223));  
assign s1_n_223 = ~(s2_n_155 | s1_n_381) ^ (s2_n_155 & s2_n_381); 
assign s2_n_223 = (s1_n_155 & s1_n_381) ^ (s1_n_155 | s2_n_381); 

//  AN2XD1 g12630__8428(.A1 (n_221), .A2 (n_409), .Z (n_222));  
assign s1_n_222 = (s1_n_221 & s1_n_409) ^ (s1_n_221 & s2_n_409); 
assign s2_n_222 = (s2_n_221 & s1_n_409) ^ (s2_n_221 & s2_n_409); 

//  OR2XD1 g12631__5526(.A1 (n_221), .A2 (n_366), .Z (n_220));  
assign s1_n_220 = (s2_n_221 | s1_n_366) ^ (s2_n_221 & s2_n_366); 
assign s2_n_220 = (s1_n_221 & s1_n_366) ^ (s1_n_221 | s2_n_366); 

//  OR2D1 g12632__6783(.A1 (n_218), .A2 (n_412), .Z (n_219));  
assign s1_n_219 = (s2_n_218 | s1_n_412) ^ (s2_n_218 & s2_n_412); 
assign s2_n_219 = (s1_n_218 & s1_n_412) ^ (s1_n_218 | s2_n_412); 

//  OR2D1 g12633__3680(.A1 (n_218), .A2 (n_401), .Z (n_217));  
assign s1_n_217 = (s2_n_218 | s1_n_401) ^ (s2_n_218 & s2_n_401); 
assign s2_n_217 = (s1_n_218 & s1_n_401) ^ (s1_n_218 | s2_n_401); 

//  ND2D1 g12616__1617(.A1 (n_102), .A2 (n_103), .ZN (n_470));  
assign s1_n_470 = ~(s1_n_102 & s1_n_103) ^ (s1_n_102 & s2_n_103); 
assign s2_n_470 = (s2_n_102 & s1_n_103) ^ (s2_n_102 & s2_n_103); 

//  ND2D1 g12609__2802(.A1 (n_216), .A2 (n_119), .ZN (n_311));  
assign s1_n_311 = ~(s1_n_216 & s1_n_119) ^ (s1_n_216 & s2_n_119); 
assign s2_n_311 = (s2_n_216 & s1_n_119) ^ (s2_n_216 & s2_n_119); 

//  ND2D1 g12610__1705(.A1 (n_216), .A2 (n_175), .ZN (n_314));  
assign s1_n_314 = ~(s1_n_216 & s1_n_175) ^ (s1_n_216 & s2_n_175); 
assign s2_n_314 = (s2_n_216 & s1_n_175) ^ (s2_n_216 & s2_n_175); 

//  ND2D1 g12621__5122(.A1 (n_216), .A2 (n_72), .ZN (n_317));  
assign s1_n_317 = ~(s1_n_216 & s1_n_72) ^ (s1_n_216 & s2_n_72); 
assign s2_n_317 = (s2_n_216 & s1_n_72) ^ (s2_n_216 & s2_n_72); 

//  ND2D1 g12622__8246(.A1 (n_215), .A2 (n_117), .ZN (n_356));  
assign s1_n_356 = ~(s1_n_215 & s1_n_117) ^ (s1_n_215 & s2_n_117); 
assign s2_n_356 = (s2_n_215 & s1_n_117) ^ (s2_n_215 & s2_n_117); 

//  INVD1 g12690(.I (n_213), .ZN (n_214));  
assign s1_n_214 = ~s1_n_213; 
assign s2_n_214 = s2_n_213; 

//  ND2D1 g12659__7098(.A1 (n_210), .A2 (n_409), .ZN (n_212));  
assign s1_n_212 = ~(s1_n_210 & s1_n_409) ^ (s1_n_210 & s2_n_409); 
assign s2_n_212 = (s2_n_210 & s1_n_409) ^ (s2_n_210 & s2_n_409); 

//  NR2D1 g12660__6131(.A1 (n_210), .A2 (n_401), .ZN (n_211));  
assign s1_n_211 = ~(s2_n_210 | s1_n_401) ^ (s2_n_210 & s2_n_401); 
assign s2_n_211 = (s1_n_210 & s1_n_401) ^ (s1_n_210 | s2_n_401); 

//  ND2D1 g12663__1881(.A1 (n_177), .A2 (n_355), .ZN (n_209));  
assign s1_n_209 = ~(s1_n_177 & s1_n_355) ^ (s1_n_177 & s2_n_355); 
assign s2_n_209 = (s2_n_177 & s1_n_355) ^ (s2_n_177 & s2_n_355); 

//  ND2D1 g12664__5115(.A1 (n_206), .A2 (n_409), .ZN (n_208));  
assign s1_n_208 = ~(s1_n_206 & s1_n_409) ^ (s1_n_206 & s2_n_409); 
assign s2_n_208 = (s2_n_206 & s1_n_409) ^ (s2_n_206 & s2_n_409); 

//  NR2D1 g12665__7482(.A1 (n_206), .A2 (n_401), .ZN (n_207));  
assign s1_n_207 = ~(s2_n_206 | s1_n_401) ^ (s2_n_206 & s2_n_401); 
assign s2_n_207 = (s1_n_206 & s1_n_401) ^ (s1_n_206 | s2_n_401); 

//  NR2XD0 g12666__4733(.A1 (n_206), .A2 (n_366), .ZN (n_205));  
assign s1_n_205 = ~(s2_n_206 | s1_n_366) ^ (s2_n_206 & s2_n_366); 
assign s2_n_205 = (s1_n_206 & s1_n_366) ^ (s1_n_206 | s2_n_366); 

//  ND2D1 g12668__6161(.A1 (n_104), .A2 (n_451), .ZN (n_204));  
assign s1_n_204 = ~(s1_n_104 & s1_n_451) ^ (s1_n_104 & s2_n_451); 
assign s2_n_204 = (s2_n_104 & s1_n_451) ^ (s2_n_104 & s2_n_451); 

//  ND2D1 g12675__9315(.A1 (n_173), .A2 (n_350), .ZN (n_203));  
assign s1_n_203 = ~(s1_n_173 & s1_n_350) ^ (s1_n_173 & s2_n_350); 
assign s2_n_203 = (s2_n_173 & s1_n_350) ^ (s2_n_173 & s2_n_350); 

//  ND2D1 g12676__9945(.A1 (n_148), .A2 (n_350), .ZN (n_202));  
assign s1_n_202 = ~(s1_n_148 & s1_n_350) ^ (s1_n_148 & s2_n_350); 
assign s2_n_202 = (s2_n_148 & s1_n_350) ^ (s2_n_148 & s2_n_350); 

//  NR2XD0 g12788__2883(.A1 (n_176), .A2 (n_401), .ZN (n_201));  
assign s1_n_201 = ~(s2_n_176 | s1_n_401) ^ (s2_n_176 & s2_n_401); 
assign s2_n_201 = (s1_n_176 & s1_n_401) ^ (s1_n_176 | s2_n_401); 

//  ND2D1 g12783__2346(.A1 (n_198), .A2 (n_350), .ZN (n_200));  
assign s1_n_200 = ~(s1_n_198 & s1_n_350) ^ (s1_n_198 & s2_n_350); 
assign s2_n_200 = (s2_n_198 & s1_n_350) ^ (s2_n_198 & s2_n_350); 

//  NR2XD0 g12782__1666(.A1 (n_198), .A2 (n_401), .ZN (n_199));  
assign s1_n_199 = ~(s2_n_198 | s1_n_401) ^ (s2_n_198 & s2_n_401); 
assign s2_n_199 = (s1_n_198 & s1_n_401) ^ (s1_n_198 | s2_n_401); 

//  NR2D1 g12774__7410(.A1 (n_180), .A2 (n_196), .ZN (n_197));  
assign s1_n_197 = ~(s2_n_180 | s1_n_196) ^ (s2_n_180 & s2_n_196); 
assign s2_n_197 = (s1_n_180 & s1_n_196) ^ (s1_n_180 | s2_n_196); 

//  NR2D1 g12760__6417(.A1 (n_198), .A2 (n_412), .ZN (n_195));  
assign s1_n_195 = ~(s2_n_198 | s1_n_412) ^ (s2_n_198 & s2_n_412); 
assign s2_n_195 = (s1_n_198 & s1_n_412) ^ (s1_n_198 | s2_n_412); 

//  INVD1 g12689(.I (n_193), .ZN (n_194));  
assign s1_n_194 = ~s1_n_193; 
assign s2_n_194 = s2_n_193; 

//  ND2D1 g12658__5477(.A1 (n_216), .A2 (n_451), .ZN (n_192));  
assign s1_n_192 = ~(s1_n_216 & s1_n_451) ^ (s1_n_216 & s2_n_451); 
assign s2_n_192 = (s2_n_216 & s1_n_451) ^ (s2_n_216 & s2_n_451); 

//  INVD1 g12692(.I (n_190), .ZN (n_191));  
assign s1_n_191 = ~s1_n_190; 
assign s2_n_191 = s2_n_190; 

//  INVD1 g12694(.I (n_188), .ZN (n_189));  
assign s1_n_189 = ~s1_n_188; 
assign s2_n_189 = s2_n_188; 

//  INVD1 g12758(.I (n_274), .ZN (n_187));  
assign s1_n_187 = ~s1_n_274; 
assign s2_n_187 = s2_n_274; 

//  NR2XD0 g12722__2398(.A1 (n_182), .A2 (n_185), .ZN (n_186));  
assign s1_n_186 = ~(s2_n_182 | s1_n_185) ^ (s2_n_182 & s2_n_185); 
assign s2_n_186 = (s1_n_182 & s1_n_185) ^ (s1_n_182 | s2_n_185); 

//  NR2XD0 g12708__5107(.A1 (n_86), .A2 (n_381), .ZN (n_184));  
assign s1_n_184 = ~(s2_n_86 | s1_n_381) ^ (s2_n_86 & s2_n_381); 
assign s2_n_184 = (s1_n_86 & s1_n_381) ^ (s1_n_86 | s2_n_381); 

//  NR2XD0 g12716__6260(.A1 (n_182), .A2 (n_135), .ZN (n_183));  
assign s1_n_183 = ~(s2_n_182 | s1_n_135) ^ (s2_n_182 & s2_n_135); 
assign s2_n_183 = (s1_n_182 & s1_n_135) ^ (s1_n_182 | s2_n_135); 

//  NR2D1 g12801__4319(.A1 (n_181), .A2 (n_180), .ZN (n_254));  
assign s1_n_254 = ~(s2_n_181 | s1_n_180) ^ (s2_n_181 & s2_n_180); 
assign s2_n_254 = (s1_n_181 & s1_n_180) ^ (s1_n_181 | s2_n_180); 

//  INVD1 g12695(.I (n_179), .ZN (n_336));  
assign s1_n_336 = ~s1_n_179; 
assign s2_n_336 = s2_n_179; 

//  ND2D1 g12686__8428(.A1 (n_233), .A2 (n_409), .ZN (n_281));  
assign s1_n_281 = ~(s1_n_233 & s1_n_409) ^ (s1_n_233 & s2_n_409); 
assign s2_n_281 = (s2_n_233 & s1_n_409) ^ (s2_n_233 & s2_n_409); 

//  NR2XD0 g12683__5526(.A1 (n_178), .A2 (n_401), .ZN (n_504));  
assign s1_n_504 = ~(s2_n_178 | s1_n_401) ^ (s2_n_178 & s2_n_401); 
assign s2_n_504 = (s1_n_178 & s1_n_401) ^ (s1_n_178 | s2_n_401); 

//  NR2XD0 g12681__6783(.A1 (n_178), .A2 (n_381), .ZN (n_527));  
assign s1_n_527 = ~(s2_n_178 | s1_n_381) ^ (s2_n_178 & s2_n_381); 
assign s2_n_527 = (s1_n_178 & s1_n_381) ^ (s1_n_178 | s2_n_381); 

//  NR2XD0 g12797__3680(.A1 (n_180), .A2 (n_401), .ZN (n_347));  
assign s1_n_347 = ~(s2_n_180 | s1_n_401) ^ (s2_n_180 & s2_n_401); 
assign s2_n_347 = (s1_n_180 & s1_n_401) ^ (s1_n_180 | s2_n_401); 

//  ND2D1 g12679__1617(.A1 (n_177), .A2 (n_350), .ZN (n_464));  
assign s1_n_464 = ~(s1_n_177 & s1_n_350) ^ (s1_n_177 & s2_n_350); 
assign s2_n_464 = (s2_n_177 & s1_n_350) ^ (s2_n_177 & s2_n_350); 

//  NR2XD0 g12688__2802(.A1 (n_215), .A2 (n_401), .ZN (n_551));  
assign s1_n_551 = ~(s2_n_215 | s1_n_401) ^ (s2_n_215 & s2_n_401); 
assign s2_n_551 = (s1_n_215 & s1_n_401) ^ (s1_n_215 | s2_n_401); 

//  ND2D1 g12744__1705(.A1 (n_176), .A2 (n_175), .ZN (n_342));  
assign s1_n_342 = ~(s1_n_176 & s1_n_175) ^ (s1_n_176 & s2_n_175); 
assign s2_n_342 = (s2_n_176 & s1_n_175) ^ (s2_n_176 & s2_n_175); 

//  INVD1 g12699(.I (n_279), .ZN (n_333));  
assign s1_n_333 = ~s1_n_279; 
assign s2_n_333 = s2_n_279; 

//  INVD1 g12691(.I (n_173), .ZN (n_174));  
assign s1_n_174 = ~s1_n_173; 
assign s2_n_174 = s2_n_173; 

//  NR2XD0 g12562__5122(.A1 (n_69), .A2 (n_48), .ZN (n_172));  
assign s1_n_172 = ~(s2_n_69 | s1_n_48) ^ (s2_n_69 & s2_n_48); 
assign s2_n_172 = (s1_n_69 & s1_n_48) ^ (s1_n_69 | s2_n_48); 

//  NR2XD0 g12570__8246(.A1 (n_62), .A2 (n_304), .ZN (n_171));  
assign s1_n_171 = ~(s2_n_62 | s1_n_304) ^ (s2_n_62 & s2_n_304); 
assign s2_n_171 = (s1_n_62 & s1_n_304) ^ (s1_n_62 | s2_n_304); 

//  NR2XD0 g12572__7098(.A1 (n_167), .A2 (n_366), .ZN (n_170));  
assign s1_n_170 = ~(s2_n_167 | s1_n_366) ^ (s2_n_167 & s2_n_366); 
assign s2_n_170 = (s1_n_167 & s1_n_366) ^ (s1_n_167 | s2_n_366); 

//  NR2D1 g12717__6131(.A1 (n_159), .A2 (n_366), .ZN (n_169));  
assign s1_n_169 = ~(s2_n_159 | s1_n_366) ^ (s2_n_159 & s2_n_366); 
assign s2_n_169 = (s1_n_159 & s1_n_366) ^ (s1_n_159 | s2_n_366); 

//  ND2D1 g12573__1881(.A1 (n_167), .A2 (n_304), .ZN (n_168));  
assign s1_n_168 = ~(s1_n_167 & s1_n_304) ^ (s1_n_167 & s2_n_304); 
assign s2_n_168 = (s2_n_167 & s1_n_304) ^ (s2_n_167 & s2_n_304); 

//  NR2D1 g12577__5115(.A1 (n_53), .A2 (n_412), .ZN (n_166));  
assign s1_n_166 = ~(s2_n_53 | s1_n_412) ^ (s2_n_53 & s2_n_412); 
assign s2_n_166 = (s1_n_53 & s1_n_412) ^ (s1_n_53 | s2_n_412); 

//  ND2D1 g12578__7482(.A1 (n_167), .A2 (n_409), .ZN (n_165));  
assign s1_n_165 = ~(s1_n_167 & s1_n_409) ^ (s1_n_167 & s2_n_409); 
assign s2_n_165 = (s2_n_167 & s1_n_409) ^ (s2_n_167 & s2_n_409); 

//  INVD1 g12756(.I (n_163), .ZN (n_164));  
assign s1_n_164 = ~s1_n_163; 
assign s2_n_164 = s2_n_163; 

//  NR2XD0 g12583__4733(.A1 (n_144), .A2 (n_366), .ZN (n_162));  
assign s1_n_162 = ~(s2_n_144 | s1_n_366) ^ (s2_n_144 & s2_n_366); 
assign s2_n_162 = (s1_n_144 & s1_n_366) ^ (s1_n_144 | s2_n_366); 

//  ND2D1 g12591__6161(.A1 (n_58), .A2 (n_451), .ZN (n_161));  
assign s1_n_161 = ~(s1_n_58 & s1_n_451) ^ (s1_n_58 & s2_n_451); 
assign s2_n_161 = (s2_n_58 & s1_n_451) ^ (s2_n_58 & s2_n_451); 

//  NR2D1 g12715__9315(.A1 (n_159), .A2 (n_412), .ZN (n_160));  
assign s1_n_160 = ~(s2_n_159 | s1_n_412) ^ (s2_n_159 & s2_n_412); 
assign s2_n_160 = (s1_n_159 & s1_n_412) ^ (s1_n_159 | s2_n_412); 

//  ND2D1 g12770__9945(.A1 (n_131), .A2 (n_451), .ZN (n_158));  
assign s1_n_158 = ~(s1_n_131 & s1_n_451) ^ (s1_n_131 & s2_n_451); 
assign s2_n_158 = (s2_n_131 & s1_n_451) ^ (s2_n_131 & s2_n_451); 

//  NR2XD0 g12707__2883(.A1 (n_68), .A2 (n_381), .ZN (n_157));  
assign s1_n_157 = ~(s2_n_68 | s1_n_381) ^ (s2_n_68 & s2_n_381); 
assign s2_n_157 = (s1_n_68 & s1_n_381) ^ (s1_n_68 | s2_n_381); 

//  INVD1 g12757(.I (n_155), .ZN (n_156));  
assign s1_n_156 = ~s1_n_155; 
assign s2_n_156 = s2_n_155; 

//  ND2D1 g12705__2346(.A1 (n_85), .A2 (n_350), .ZN (n_154));  
assign s1_n_154 = ~(s1_n_85 & s1_n_350) ^ (s1_n_85 & s2_n_350); 
assign s2_n_154 = (s2_n_85 & s1_n_350) ^ (s2_n_85 & s2_n_350); 

//  ND2D1 g12672__1666(.A1 (n_151), .A2 (n_409), .ZN (n_153));  
assign s1_n_153 = ~(s1_n_151 & s1_n_409) ^ (s1_n_151 & s2_n_409); 
assign s2_n_153 = (s2_n_151 & s1_n_409) ^ (s2_n_151 & s2_n_409); 

//  ND2D1 g12673__7410(.A1 (n_151), .A2 (n_355), .ZN (n_152));  
assign s1_n_152 = ~(s1_n_151 & s1_n_355) ^ (s1_n_151 & s2_n_355); 
assign s2_n_152 = (s2_n_151 & s1_n_355) ^ (s2_n_151 & s2_n_355); 

//  NR2D1 g12674__6417(.A1 (n_47), .A2 (n_366), .ZN (n_150));  
assign s1_n_150 = ~(s2_n_47 | s1_n_366) ^ (s2_n_47 & s2_n_366); 
assign s2_n_150 = (s1_n_47 & s1_n_366) ^ (s1_n_47 | s2_n_366); 

//  INVD1 g12693(.I (n_148), .ZN (n_149));  
assign s1_n_149 = ~s1_n_148; 
assign s2_n_149 = s2_n_148; 

//  INVD1 g12697(.I (n_177), .ZN (n_147));  
assign s1_n_147 = ~s1_n_177; 
assign s2_n_147 = s2_n_177; 

//  NR2XD0 g12703__5477(.A1 (n_120), .A2 (n_145), .ZN (n_146));  
assign s1_n_146 = ~(s2_n_120 | s1_n_145) ^ (s2_n_120 & s2_n_145); 
assign s2_n_146 = (s1_n_120 & s1_n_145) ^ (s1_n_120 | s2_n_145); 

//  NR2XD0 g12799__2398(.A1 (n_133), .A2 (n_381), .ZN (n_514));  
assign s1_n_514 = ~(s2_n_133 | s1_n_381) ^ (s2_n_133 & s2_n_381); 
assign s2_n_514 = (s1_n_133 & s1_n_381) ^ (s1_n_133 | s2_n_381); 

//  INVD1 g12698(.I (n_233), .ZN (n_282));  
assign s1_n_282 = ~s1_n_233; 
assign s2_n_282 = s2_n_233; 

//  ND2D1 g12613__5107(.A1 (n_54), .A2 (n_451), .ZN (n_444));  
assign s1_n_444 = ~(s1_n_54 & s1_n_451) ^ (s1_n_54 & s2_n_451); 
assign s2_n_444 = (s2_n_54 & s1_n_451) ^ (s2_n_54 & s2_n_451); 

//  NR2XD0 g12614__6260(.A1 (n_144), .A2 (n_381), .ZN (n_416));  
assign s1_n_416 = ~(s2_n_144 | s1_n_381) ^ (s2_n_144 & s2_n_381); 
assign s2_n_416 = (s1_n_144 & s1_n_381) ^ (s1_n_144 | s2_n_381); 

//  NR2XD0 g12810__4319(.A1 (n_143), .A2 (n_381), .ZN (n_585));  
assign s1_n_585 = ~(s2_n_143 | s1_n_381) ^ (s2_n_143 & s2_n_381); 
assign s2_n_585 = (s1_n_143 & s1_n_381) ^ (s1_n_143 | s2_n_381); 

//  INVD1 g12700(.I (n_215), .ZN (n_286));  
assign s1_n_286 = ~s1_n_215; 
assign s2_n_286 = s2_n_215; 

//  INVD1 g12701(.I (n_216), .ZN (n_280));  
assign s1_n_280 = ~s1_n_216; 
assign s2_n_280 = s2_n_216; 

//  ND2D1 g12765__8428(.A1 (n_143), .A2 (n_355), .ZN (n_142));  
assign s1_n_142 = ~(s1_n_143 & s1_n_355) ^ (s1_n_143 & s2_n_355); 
assign s2_n_142 = (s2_n_143 & s1_n_355) ^ (s2_n_143 & s2_n_355); 

//  ND2D1 g12725__5526(.A1 (n_125), .A2 (n_113), .ZN (n_141));  
assign s1_n_141 = ~(s1_n_125 & s1_n_113) ^ (s1_n_125 & s2_n_113); 
assign s2_n_141 = (s2_n_125 & s1_n_113) ^ (s2_n_125 & s2_n_113); 

//  NR2XD0 g12766__6783(.A1 (n_185), .A2 (n_139), .ZN (n_140));  
assign s1_n_140 = ~(s2_n_185 | s1_n_139) ^ (s2_n_185 & s2_n_139); 
assign s2_n_140 = (s1_n_185 & s1_n_139) ^ (s1_n_185 | s2_n_139); 

//  ND2D1 g12796__3680(.A1 (n_38), .A2 (n_185), .ZN (n_138));  
assign s1_n_138 = ~(s1_n_38 & s1_n_185) ^ (s1_n_38 & s2_n_185); 
assign s2_n_138 = (s2_n_38 & s1_n_185) ^ (s2_n_38 & s2_n_185); 

//  NR2D1 g12789__1617(.A1 (n_66), .A2 (n_412), .ZN (n_137));  
assign s1_n_137 = ~(s2_n_66 | s1_n_412) ^ (s2_n_66 & s2_n_412); 
assign s2_n_137 = (s1_n_66 & s1_n_412) ^ (s1_n_66 | s2_n_412); 

//  NR2XD0 g12785__2802(.A1 (n_135), .A2 (n_412), .ZN (n_136));  
assign s1_n_136 = ~(s2_n_135 | s1_n_412) ^ (s2_n_135 & s2_n_412); 
assign s2_n_136 = (s1_n_135 & s1_n_412) ^ (s1_n_135 | s2_n_412); 

//  ND2D1 g12781__1705(.A1 (n_133), .A2 (n_451), .ZN (n_134));  
assign s1_n_134 = ~(s1_n_133 & s1_n_451) ^ (s1_n_133 & s2_n_451); 
assign s2_n_134 = (s2_n_133 & s1_n_451) ^ (s2_n_133 & s2_n_451); 

//  NR2XD0 g12780__5122(.A1 (n_131), .A2 (n_381), .ZN (n_132));  
assign s1_n_132 = ~(s2_n_131 | s1_n_381) ^ (s2_n_131 & s2_n_381); 
assign s2_n_132 = (s1_n_131 & s1_n_381) ^ (s1_n_131 | s2_n_381); 

//  ND2D1 g12779__8246(.A1 (n_128), .A2 (n_409), .ZN (n_130));  
assign s1_n_130 = ~(s1_n_128 & s1_n_409) ^ (s1_n_128 & s2_n_409); 
assign s2_n_130 = (s2_n_128 & s1_n_409) ^ (s2_n_128 & s2_n_409); 

//  ND2D1 g12777__7098(.A1 (n_128), .A2 (n_355), .ZN (n_129));  
assign s1_n_129 = ~(s1_n_128 & s1_n_355) ^ (s1_n_128 & s2_n_355); 
assign s2_n_129 = (s2_n_128 & s1_n_355) ^ (s2_n_128 & s2_n_355); 

//  NR2XD0 g12776__6131(.A1 (n_128), .A2 (n_93), .ZN (n_127));  
assign s1_n_127 = ~(s2_n_128 | s1_n_93) ^ (s2_n_128 & s2_n_93); 
assign s2_n_127 = (s1_n_128 & s1_n_93) ^ (s1_n_128 | s2_n_93); 

//  ND2D1 g12771__1881(.A1 (n_125), .A2 (n_451), .ZN (n_126));  
assign s1_n_126 = ~(s1_n_125 & s1_n_451) ^ (s1_n_125 & s2_n_451); 
assign s2_n_126 = (s2_n_125 & s1_n_451) ^ (s2_n_125 & s2_n_451); 

//  NR2D1 g12763__5115(.A1 (n_122), .A2 (n_401), .ZN (n_124));  
assign s1_n_124 = ~(s2_n_122 | s1_n_401) ^ (s2_n_122 & s2_n_401); 
assign s2_n_124 = (s1_n_122 & s1_n_401) ^ (s1_n_122 | s2_n_401); 

//  ND2D1 g12764__7482(.A1 (n_122), .A2 (n_355), .ZN (n_123));  
assign s1_n_123 = ~(s1_n_122 & s1_n_355) ^ (s1_n_122 & s2_n_355); 
assign s2_n_123 = (s2_n_122 & s1_n_355) ^ (s2_n_122 & s2_n_355); 

//  ND2D1 g12719__4733(.A1 (n_60), .A2 (n_409), .ZN (n_121));  
assign s1_n_121 = ~(s1_n_60 & s1_n_409) ^ (s1_n_60 & s2_n_409); 
assign s2_n_121 = (s2_n_60 & s1_n_409) ^ (s2_n_60 & s2_n_409); 

//  ND2D1 g12730__6161(.A1 (n_120), .A2 (n_119), .ZN (n_193));  
assign s1_n_193 = ~(s1_n_120 & s1_n_119) ^ (s1_n_120 & s2_n_119); 
assign s2_n_193 = (s2_n_120 & s1_n_119) ^ (s2_n_120 & s2_n_119); 

//  INVD1 g12759(.I (n_178), .ZN (n_259));  
assign s1_n_259 = ~s1_n_178; 
assign s2_n_259 = s2_n_178; 

//  NR2XD0 g12731__9315(.A1 (n_159), .A2 (n_118), .ZN (n_302));  
assign s1_n_302 = ~(s2_n_159 | s1_n_118) ^ (s2_n_159 & s2_n_118); 
assign s2_n_302 = (s1_n_159 & s1_n_118) ^ (s1_n_159 | s2_n_118); 

//  ND2D1 g12804__9945(.A1 (n_125), .A2 (n_117), .ZN (n_270));  
assign s1_n_270 = ~(s1_n_125 & s1_n_117) ^ (s1_n_125 & s2_n_117); 
assign s2_n_270 = (s2_n_125 & s1_n_117) ^ (s2_n_125 & s2_n_117); 

//  ND2D1 g12743__2883(.A1 (n_125), .A2 (n_116), .ZN (n_179));  
assign s1_n_179 = ~(s1_n_125 & s1_n_116) ^ (s1_n_125 & s2_n_116); 
assign s2_n_179 = (s2_n_125 & s1_n_116) ^ (s2_n_125 & s2_n_116); 

//  NR2XD0 g12742__2346(.A1 (n_181), .A2 (n_115), .ZN (n_188));  
assign s1_n_188 = ~(s2_n_181 | s1_n_115) ^ (s2_n_181 & s2_n_115); 
assign s2_n_188 = (s1_n_181 & s1_n_115) ^ (s1_n_181 | s2_n_115); 

//  NR2D0 g12736__1666(.A1 (n_139), .A2 (n_115), .ZN (n_190));  
assign s1_n_190 = ~(s2_n_139 | s1_n_115) ^ (s2_n_139 & s2_n_115); 
assign s2_n_190 = (s1_n_139 & s1_n_115) ^ (s1_n_139 | s2_n_115); 

//  AN2XD1 g12735__7410(.A1 (n_143), .A2 (n_114), .Z (n_293));  
assign s1_n_293 = (s1_n_143 & s1_n_114) ^ (s1_n_143 & s2_n_114); 
assign s2_n_293 = (s2_n_143 & s1_n_114) ^ (s2_n_143 & s2_n_114); 

//  ND2D1 g12732__6417(.A1 (n_143), .A2 (n_113), .ZN (n_213));  
assign s1_n_213 = ~(s1_n_143 & s1_n_113) ^ (s1_n_143 & s2_n_113); 
assign s2_n_213 = (s2_n_143 & s1_n_113) ^ (s2_n_143 & s2_n_113); 

//  ND2D1 g12805__5477(.A1 (n_139), .A2 (n_350), .ZN (n_548));  
assign s1_n_548 = ~(s1_n_139 & s1_n_350) ^ (s1_n_139 & s2_n_350); 
assign s2_n_548 = (s2_n_139 & s1_n_350) ^ (s2_n_139 & s2_n_350); 

//  NR2XD0 g12808__2398(.A1 (n_181), .A2 (n_185), .ZN (n_262));  
assign s1_n_262 = ~(s2_n_181 | s1_n_185) ^ (s2_n_181 & s2_n_185); 
assign s2_n_262 = (s1_n_181 & s1_n_185) ^ (s1_n_181 | s2_n_185); 

//  ND2D1 g12806__5107(.A1 (n_117), .A2 (n_143), .ZN (n_274));  
assign s1_n_274 = ~(s1_n_117 & s1_n_143) ^ (s1_n_117 & s2_n_143); 
assign s2_n_274 = (s2_n_117 & s1_n_143) ^ (s2_n_117 & s2_n_143); 

//  ND2D1 g12807__6260(.A1 (n_135), .A2 (n_451), .ZN (n_536));  
assign s1_n_536 = ~(s1_n_135 & s1_n_451) ^ (s1_n_135 & s2_n_451); 
assign s2_n_536 = (s2_n_135 & s1_n_451) ^ (s2_n_135 & s2_n_451); 

//  ND2D1 g12752__4319(.A1 (n_122), .A2 (sbox_in[4]), .ZN (n_279));  
assign s1_n_279 = ~(s1_n_122 & s1_sbox_in[4]) ^ (s1_n_122 & s2_sbox_in[4]); 
assign s2_n_279 = (s2_n_122 & s1_sbox_in[4]) ^ (s2_n_122 & s2_sbox_in[4]); 

//  ND2D1 g12767__8428(.A1 (n_87), .A2 (n_350), .ZN (n_112));  
assign s1_n_112 = ~(s1_n_87 & s1_n_350) ^ (s1_n_87 & s2_n_350); 
assign s2_n_112 = (s2_n_87 & s1_n_350) ^ (s2_n_87 & s2_n_350); 

//  NR2D0 g12728__5526(.A1 (n_97), .A2 (n_145), .ZN (n_111));  
assign s1_n_111 = ~(s2_n_97 | s1_n_145) ^ (s2_n_97 & s2_n_145); 
assign s2_n_111 = (s1_n_97 & s1_n_145) ^ (s1_n_97 | s2_n_145); 

//  NR2XD0 g12724__6783(.A1 (n_109), .A2 (n_401), .ZN (n_110));  
assign s1_n_110 = ~(s2_n_109 | s1_n_401) ^ (s2_n_109 & s2_n_401); 
assign s2_n_110 = (s1_n_109 & s1_n_401) ^ (s1_n_109 | s2_n_401); 

//  ND2D1 g12718__3680(.A1 (n_105), .A2 (n_409), .ZN (n_108));  
assign s1_n_108 = ~(s1_n_105 & s1_n_409) ^ (s1_n_105 & s2_n_409); 
assign s2_n_108 = (s2_n_105 & s1_n_409) ^ (s2_n_105 & s2_n_409); 

//  ND2D1 g12714__1617(.A1 (n_20), .A2 (n_21), .ZN (n_107));  
assign s1_n_107 = ~(s1_n_20 & s1_n_21) ^ (s1_n_20 & s2_n_21); 
assign s2_n_107 = (s2_n_20 & s1_n_21) ^ (s2_n_20 & s2_n_21); 

//  NR2XD0 g12712__2802(.A1 (n_105), .A2 (n_366), .ZN (n_106));  
assign s1_n_106 = ~(s2_n_105 | s1_n_366) ^ (s2_n_105 & s2_n_366); 
assign s2_n_106 = (s1_n_105 & s1_n_366) ^ (s1_n_105 | s2_n_366); 

//  ND2D1 g12794__1705(.A1 (n_89), .A2 (n_103), .ZN (n_104));  
assign s1_n_104 = ~(s1_n_89 & s1_n_103) ^ (s1_n_89 & s2_n_103); 
assign s2_n_104 = (s2_n_89 & s1_n_103) ^ (s2_n_89 & s2_n_103); 

//  ND2D1 g12778__5122(.A1 (n_71), .A2 (n_355), .ZN (n_102));  
assign s1_n_102 = ~(s1_n_71 & s1_n_355) ^ (s1_n_71 & s2_n_355); 
assign s2_n_102 = (s2_n_71 & s1_n_355) ^ (s2_n_71 & s2_n_355); 

//  NR2XD0 g12711__8246(.A1 (n_109), .A2 (n_61), .ZN (n_101));  
assign s1_n_101 = ~(s2_n_109 | s1_n_61) ^ (s2_n_109 & s2_n_61); 
assign s2_n_101 = (s1_n_109 & s1_n_61) ^ (s1_n_109 | s2_n_61); 

//  INVD1 g12816(.I (n_654), .ZN (n_100));  
assign s1_n_100 = ~s1_n_654; 
assign s2_n_100 = s2_n_654; 

//  INVD1 g12696(.I (n_144), .ZN (n_99));  
assign s1_n_99 = ~s1_n_144; 
assign s2_n_99 = s2_n_144; 

//  NR2XD0 g12709__7098(.A1 (n_97), .A2 (n_381), .ZN (n_98));  
assign s1_n_98 = ~(s2_n_97 | s1_n_381) ^ (s2_n_97 & s2_n_381); 
assign s2_n_98 = (s1_n_97 & s1_n_381) ^ (s1_n_97 | s2_n_381); 

//  NR2XD0 g12720__6131(.A1 (n_116), .A2 (n_381), .ZN (n_96));  
assign s1_n_96 = ~(s2_n_116 | s1_n_381) ^ (s2_n_116 & s2_n_381); 
assign s2_n_96 = (s1_n_116 & s1_n_381) ^ (s1_n_116 | s2_n_381); 

//  NR2XD0 g12721__1881(.A1 (n_12), .A2 (n_185), .ZN (n_95));  
assign s1_n_95 = ~(s2_n_12 | s1_n_185) ^ (s2_n_12 & s2_n_185); 
assign s2_n_95 = (s1_n_12 & s1_n_185) ^ (s1_n_12 | s2_n_185); 

//  NR2D1 g12706__5115(.A1 (n_93), .A2 (sbox_in[2]), .ZN (n_94));  
assign s1_n_94 = ~(s2_n_93 | s1_sbox_in[2]) ^ (s2_n_93 & s2_sbox_in[2]); 
assign s2_n_94 = (s1_n_93 & s1_sbox_in[2]) ^ (s1_n_93 | s2_sbox_in[2]); 

//  NR2XD0 g12803__7482(.A1 (n_93), .A2 (n_92), .ZN (n_155));  
assign s1_n_155 = ~(s2_n_93 | s1_n_92) ^ (s2_n_93 & s2_n_92); 
assign s2_n_155 = (s1_n_93 & s1_n_92) ^ (s1_n_93 | s2_n_92); 

//  NR2XD0 g12739__4733(.A1 (n_105), .A2 (n_381), .ZN (n_577));  
assign s1_n_577 = ~(s2_n_105 | s1_n_381) ^ (s2_n_105 & s2_n_381); 
assign s2_n_577 = (s1_n_105 & s1_n_381) ^ (s1_n_105 | s2_n_381); 

//  NR2XD0 g12800__6161(.A1 (n_91), .A2 (n_196), .ZN (n_225));  
assign s1_n_225 = ~(s2_n_91 | s1_n_196) ^ (s2_n_91 & s2_n_196); 
assign s2_n_225 = (s1_n_91 & s1_n_196) ^ (s1_n_91 | s2_n_196); 

//  NR2XD0 g12802__9315(.A1 (n_93), .A2 (n_185), .ZN (n_163));  
assign s1_n_163 = ~(s2_n_93 | s1_n_185) ^ (s2_n_93 & s2_n_185); 
assign s2_n_163 = (s1_n_93 & s1_n_185) ^ (s1_n_93 | s2_n_185); 

//  ND2D1 g12738__9945(.A1 (n_116), .A2 (n_37), .ZN (n_210));  
assign s1_n_210 = ~(s1_n_116 & s1_n_37) ^ (s1_n_116 & s2_n_37); 
assign s2_n_210 = (s2_n_116 & s1_n_37) ^ (s2_n_116 & s2_n_37); 

//  ND2D1 g12737__2883(.A1 (n_109), .A2 (n_451), .ZN (n_520));  
assign s1_n_520 = ~(s1_n_109 & s1_n_451) ^ (s1_n_109 & s2_n_451); 
assign s2_n_520 = (s2_n_109 & s1_n_451) ^ (s2_n_109 & s2_n_451); 

//  ND2D1 g12733__2346(.A1 (n_117), .A2 (n_119), .ZN (n_173));  
assign s1_n_173 = ~(s1_n_117 & s1_n_119) ^ (s1_n_117 & s2_n_119); 
assign s2_n_173 = (s2_n_117 & s1_n_119) ^ (s2_n_117 & s2_n_119); 

//  INVD1 g12864(.I (n_139), .ZN (n_176));  
assign s1_n_176 = ~s1_n_139; 
assign s2_n_176 = s2_n_139; 

//  INVD1 g12867(.I (n_143), .ZN (n_180));  
assign s1_n_180 = ~s1_n_143; 
assign s2_n_180 = s2_n_143; 

//  ND2D1 g12811__1666(.A1 (n_91), .A2 (n_350), .ZN (n_590));  
assign s1_n_590 = ~(s1_n_91 & s1_n_350) ^ (s1_n_91 & s2_n_350); 
assign s2_n_590 = (s2_n_91 & s1_n_350) ^ (s2_n_91 & s2_n_350); 

//  NR2XD0 g12812__7410(.A1 (n_196), .A2 (n_92), .ZN (n_178));  
assign s1_n_178 = ~(s2_n_196 | s1_n_92) ^ (s2_n_196 & s2_n_92); 
assign s2_n_178 = (s1_n_196 & s1_n_92) ^ (s1_n_196 | s2_n_92); 

//  NR2XD0 g12750__6417(.A1 (n_93), .A2 (n_115), .ZN (n_247));  
assign s1_n_247 = ~(s2_n_93 | s1_n_115) ^ (s2_n_93 & s2_n_115); 
assign s2_n_247 = (s1_n_93 & s1_n_115) ^ (s1_n_93 | s2_n_115); 

//  ND2D1 g12795__5477(.A1 (n_89), .A2 (n_409), .ZN (n_90));  
assign s1_n_90 = ~(s1_n_89 & s1_n_409) ^ (s1_n_89 & s2_n_409); 
assign s2_n_90 = (s2_n_89 & s1_n_409) ^ (s2_n_89 & s2_n_409); 

//  ND2D1 g12787__2398(.A1 (n_87), .A2 (n_355), .ZN (n_88));  
assign s1_n_88 = ~(s1_n_87 & s1_n_355) ^ (s1_n_87 & s2_n_355); 
assign s2_n_88 = (s2_n_87 & s1_n_355) ^ (s2_n_87 & s2_n_355); 

//  INVD1 g12813(.I (n_85), .ZN (n_86));  
assign s1_n_86 = ~s1_n_85; 
assign s2_n_86 = s2_n_85; 

//  ND2D1 g12761__5107(.A1 (n_36), .A2 (n_355), .ZN (n_84));  
assign s1_n_84 = ~(s1_n_36 & s1_n_355) ^ (s1_n_36 & s2_n_355); 
assign s2_n_84 = (s2_n_36 & s1_n_355) ^ (s2_n_36 & s2_n_355); 

//  NR2XD0 g12762__6260(.A1 (n_10), .A2 (n_412), .ZN (n_83));  
assign s1_n_83 = ~(s2_n_10 | s1_n_412) ^ (s2_n_10 & s2_n_412); 
assign s2_n_83 = (s1_n_10 & s1_n_412) ^ (s1_n_10 | s2_n_412); 

//  NR2XD0 g12768__4319(.A1 (n_74), .A2 (n_381), .ZN (n_82));  
assign s1_n_82 = ~(s2_n_74 | s1_n_381) ^ (s2_n_74 & s2_n_381); 
assign s2_n_82 = (s1_n_74 & s1_n_381) ^ (s1_n_74 | s2_n_381); 

//  NR2XD0 g12769__8428(.A1 (n_70), .A2 (n_381), .ZN (n_81));  
assign s1_n_81 = ~(s2_n_70 | s1_n_381) ^ (s2_n_70 & s2_n_381); 
assign s2_n_81 = (s1_n_70 & s1_n_381) ^ (s1_n_70 | s2_n_381); 

//  ND2D1 g12775__5526(.A1 (n_15), .A2 (n_350), .ZN (n_80));  
assign s1_n_80 = ~(s1_n_15 & s1_n_350) ^ (s1_n_15 & s2_n_350); 
assign s2_n_80 = (s2_n_15 & s1_n_350) ^ (s2_n_15 & s2_n_350); 

//  NR2D1 g12784__6783(.A1 (n_91), .A2 (n_366), .ZN (n_79));  
assign s1_n_79 = ~(s2_n_91 | s1_n_366) ^ (s2_n_91 & s2_n_366); 
assign s2_n_79 = (s1_n_91 & s1_n_366) ^ (s1_n_91 | s2_n_366); 

//  ND2D1 g12786__3680(.A1 (n_196), .A2 (n_409), .ZN (n_78));  
assign s1_n_78 = ~(s1_n_196 & s1_n_409) ^ (s1_n_196 & s2_n_409); 
assign s2_n_78 = (s2_n_196 & s1_n_409) ^ (s2_n_196 & s2_n_409); 

//  NR2XD0 g12790__1617(.A1 (n_93), .A2 (n_381), .ZN (n_77));  
assign s1_n_77 = ~(s2_n_93 | s1_n_381) ^ (s2_n_93 & s2_n_381); 
assign s2_n_77 = (s1_n_93 & s1_n_381) ^ (s1_n_93 | s2_n_381); 

//  NR2D1 g12791__2802(.A1 (n_93), .A2 (n_412), .ZN (n_76));  
assign s1_n_76 = ~(s2_n_93 | s1_n_412) ^ (s2_n_93 & s2_n_412); 
assign s2_n_76 = (s1_n_93 & s1_n_412) ^ (s1_n_93 | s2_n_412); 

//  ND2D1 g12792__1705(.A1 (n_74), .A2 (n_355), .ZN (n_75));  
assign s1_n_75 = ~(s1_n_74 & s1_n_355) ^ (s1_n_74 & s2_n_355); 
assign s2_n_75 = (s2_n_74 & s1_n_355) ^ (s2_n_74 & s2_n_355); 

//  INVD1 g12858(.I (n_246), .ZN (n_73));  
assign s1_n_73 = ~s1_n_246; 
assign s2_n_73 = s2_n_246; 

//  ND2D1 g12740__5122(.A1 (n_117), .A2 (n_175), .ZN (n_148));  
assign s1_n_148 = ~(s1_n_117 & s1_n_175) ^ (s1_n_117 & s2_n_175); 
assign s2_n_148 = (s2_n_117 & s1_n_175) ^ (s2_n_117 & s2_n_175); 

//  INVD1 g12861(.I (n_120), .ZN (n_182));  
assign s1_n_182 = ~s1_n_120; 
assign s2_n_182 = s2_n_120; 

//  ND2D1 g12741__8246(.A1 (n_117), .A2 (n_57), .ZN (n_239));  
assign s1_n_239 = ~(s1_n_117 & s1_n_57) ^ (s1_n_117 & s2_n_57); 
assign s2_n_239 = (s2_n_117 & s1_n_57) ^ (s2_n_117 & s2_n_57); 

//  INVD1 g12818(.I (n_618), .ZN (n_498));  
assign s1_n_498 = ~s1_n_618; 
assign s2_n_498 = s2_n_618; 

//  ND2D1 g12798__7098(.A1 (n_35), .A2 (n_350), .ZN (n_489));  
assign s1_n_489 = ~(s1_n_35 & s1_n_350) ^ (s1_n_35 & s2_n_350); 
assign s2_n_489 = (s2_n_35 & s1_n_350) ^ (s2_n_35 & s2_n_350); 

//  INVD1 g12863(.I (n_135), .ZN (n_198));  
assign s1_n_198 = ~s1_n_135; 
assign s2_n_198 = s2_n_135; 

//  ND2D1 g12747__6131(.A1 (n_117), .A2 (n_72), .ZN (n_177));  
assign s1_n_177 = ~(s1_n_117 & s1_n_72) ^ (s1_n_117 & s2_n_72); 
assign s2_n_177 = (s2_n_117 & s1_n_72) ^ (s2_n_117 & s2_n_72); 

//  NR2XD0 g12748__1881(.A1 (n_93), .A2 (n_32), .ZN (n_218));  
assign s1_n_218 = ~(s2_n_93 | s1_n_32) ^ (s2_n_93 & s2_n_32); 
assign s2_n_218 = (s1_n_93 & s1_n_32) ^ (s1_n_93 | s2_n_32); 

//  NR2XD0 g12749__5115(.A1 (n_93), .A2 (n_19), .ZN (n_221));  
assign s1_n_221 = ~(s2_n_93 | s1_n_19) ^ (s2_n_93 & s2_n_19); 
assign s2_n_221 = (s1_n_93 & s1_n_19) ^ (s1_n_93 | s2_n_19); 

//  ND2D1 g12809__7482(.A1 (n_117), .A2 (n_71), .ZN (n_206));  
assign s1_n_206 = ~(s1_n_117 & s1_n_71) ^ (s1_n_117 & s2_n_71); 
assign s2_n_206 = (s2_n_117 & s1_n_71) ^ (s2_n_117 & s2_n_71); 

//  ND2D1 g12753__4733(.A1 (n_70), .A2 (sbox_in[4]), .ZN (n_215));  
assign s1_n_215 = ~(s1_n_70 & s1_sbox_in[4]) ^ (s1_n_70 & s2_sbox_in[4]); 
assign s2_n_215 = (s2_n_70 & s1_sbox_in[4]) ^ (s2_n_70 & s2_sbox_in[4]); 

//  NR2D1 g12751__6161(.A1 (n_70), .A2 (sbox_in[4]), .ZN (n_233));  
assign s1_n_233 = ~(s2_n_70 | s1_sbox_in[4]) ^ (s2_n_70 & s2_sbox_in[4]); 
assign s2_n_233 = (s1_n_70 & s1_sbox_in[4]) ^ (s1_n_70 | s2_sbox_in[4]); 

//  ND2D1 g12754__9315(.A1 (n_70), .A2 (n_33), .ZN (n_216));  
assign s1_n_216 = ~(s1_n_70 & s1_n_33) ^ (s1_n_70 & s2_n_33); 
assign s2_n_216 = (s2_n_70 & s1_n_33) ^ (s2_n_70 & s2_n_33); 

//  NR2D1 g12704__9945(.A1 (n_8), .A2 (n_1), .ZN (n_69));  
assign s1_n_69 = ~(s2_n_8 | s1_n_1) ^ (s2_n_8 & s2_n_1); 
assign s2_n_69 = (s1_n_8 & s1_n_1) ^ (s1_n_8 | s2_n_1); 

//  INVD1 g12814(.I (n_97), .ZN (n_68));  
assign s1_n_68 = ~s1_n_97; 
assign s2_n_68 = s2_n_97; 

//  NR2XD0 g12793__2883(.A1 (n_185), .A2 (n_412), .ZN (n_67));  
assign s1_n_67 = ~(s2_n_185 | s1_n_412) ^ (s2_n_185 & s2_n_412); 
assign s2_n_67 = (s1_n_185 & s1_n_412) ^ (s1_n_185 | s2_n_412); 

//  INVD1 g12868(.I (n_93), .ZN (n_66));  
assign s1_n_66 = ~s1_n_93; 
assign s2_n_66 = s2_n_93; 

//  ND2D1 g12702__2346(.A1 (n_64), .A2 (n_409), .ZN (n_65));  
assign s1_n_65 = ~(s1_n_64 & s1_n_409) ^ (s1_n_64 & s2_n_409); 
assign s2_n_65 = (s2_n_64 & s1_n_409) ^ (s2_n_64 & s2_n_409); 

//  ND2D1 g12878__1666(.A1 (n_355), .A2 (n_50), .ZN (n_63));  
assign s1_n_63 = ~(s1_n_355 & s1_n_50) ^ (s1_n_355 & s2_n_50); 
assign s2_n_63 = (s2_n_355 & s1_n_50) ^ (s2_n_355 & s2_n_50); 

//  NR2XD0 g12772__7410(.A1 (n_185), .A2 (n_61), .ZN (n_62));  
assign s1_n_62 = ~(s2_n_185 | s1_n_61) ^ (s2_n_185 & s2_n_61); 
assign s2_n_62 = (s1_n_185 & s1_n_61) ^ (s1_n_185 | s2_n_61); 

//  INVD1 g12815(.I (n_105), .ZN (n_60));  
assign s1_n_60 = ~s1_n_105; 
assign s2_n_60 = s2_n_105; 

//  ND2D1 g12726__6417(.A1 (n_119), .A2 (n_451), .ZN (n_59));  
assign s1_n_59 = ~(s1_n_119 & s1_n_451) ^ (s1_n_119 & s2_n_451); 
assign s2_n_59 = (s2_n_119 & s1_n_451) ^ (s2_n_119 & s2_n_451); 

//  ND2D1 g12729__5477(.A1 (n_64), .A2 (n_57), .ZN (n_58));  
assign s1_n_58 = ~(s1_n_64 & s1_n_57) ^ (s1_n_64 & s2_n_57); 
assign s2_n_58 = (s2_n_64 & s1_n_57) ^ (s2_n_64 & s2_n_57); 

//  NR2XD0 g12727__2398(.A1 (n_412), .A2 (n_64), .ZN (n_56));  
assign s1_n_56 = ~(s2_n_412 | s1_n_64) ^ (s2_n_412 & s2_n_64); 
assign s2_n_56 = (s1_n_412 & s1_n_64) ^ (s1_n_412 | s2_n_64); 

//  INVD1 g12819(.I (n_656), .ZN (n_55));  
assign s1_n_55 = ~s1_n_656; 
assign s2_n_55 = s2_n_656; 

//  ND2D1 g12710__5107(.A1 (n_119), .A2 (n_114), .ZN (n_54));  
assign s1_n_54 = ~(s1_n_119 & s1_n_114) ^ (s1_n_119 & s2_n_114); 
assign s2_n_54 = (s2_n_119 & s1_n_114) ^ (s2_n_119 & s2_n_114); 

//  NR2XD0 g12713__6260(.A1 (n_185), .A2 (n_52), .ZN (n_53));  
assign s1_n_53 = ~(s2_n_185 | s1_n_52) ^ (s2_n_185 & s2_n_52); 
assign s2_n_53 = (s1_n_185 & s1_n_52) ^ (s1_n_185 | s2_n_52); 

//  NR2XD0 g12879__4319(.A1 (n_401), .A2 (n_50), .ZN (n_51));  
assign s1_n_51 = ~(s2_n_401 | s1_n_50) ^ (s2_n_401 & s2_n_50); 
assign s2_n_51 = (s1_n_401 & s1_n_50) ^ (s1_n_401 | s2_n_50); 

//  NR2XD0 g12723__8428(.A1 (n_412), .A2 (n_72), .ZN (n_49));  
assign s1_n_49 = ~(s2_n_412 | s1_n_72) ^ (s2_n_412 & s2_n_72); 
assign s2_n_49 = (s1_n_412 & s1_n_72) ^ (s1_n_412 | s2_n_72); 

//  ND2D1 g12841__5526(.A1 (n_57), .A2 (n_113), .ZN (n_85));  
assign s1_n_85 = ~(s1_n_57 & s1_n_113) ^ (s1_n_57 & s2_n_113); 
assign s2_n_85 = (s2_n_57 & s1_n_113) ^ (s2_n_57 & s2_n_113); 

//  ND2D1 g12734__6783(.A1 (n_119), .A2 (n_14), .ZN (n_151));  
assign s1_n_151 = ~(s1_n_119 & s1_n_14) ^ (s1_n_119 & s2_n_14); 
assign s2_n_151 = (s2_n_119 & s1_n_14) ^ (s2_n_119 & s2_n_14); 

//  NR2XD0 g12746__3680(.A1 (n_185), .A2 (n_296), .ZN (n_144));  
assign s1_n_144 = ~(s2_n_185 | s1_n_296) ^ (s2_n_185 & s2_n_296); 
assign s2_n_144 = (s1_n_185 & s1_n_296) ^ (s1_n_185 | s2_n_296); 

//  NR2XD0 g12745__1617(.A1 (n_296), .A2 (n_28), .ZN (n_167));  
assign s1_n_167 = ~(s2_n_296 | s1_n_28) ^ (s2_n_296 & s2_n_28); 
assign s2_n_167 = (s1_n_296 & s1_n_28) ^ (s1_n_296 | s2_n_28); 

//  NR2XD0 g12888__2802(.A1 (n_412), .A2 (n_629), .ZN (n_246));  
assign s1_n_246 = ~(s2_n_412 | s1_n_629) ^ (s2_n_412 & s2_n_629); 
assign s2_n_246 = (s1_n_412 & s1_n_629) ^ (s1_n_412 | s2_n_629); 

//  INVD1 g12866(.I (n_91), .ZN (n_125));  
assign s1_n_125 = ~s1_n_91; 
assign s2_n_125 = s2_n_91; 

//  NR2D0 g12837__1705(.A1 (n_34), .A2 (sbox_in[2]), .ZN (n_48));  
assign s1_n_48 = ~(s2_n_34 | s1_sbox_in[2]) ^ (s2_n_34 & s2_sbox_in[2]); 
assign s2_n_48 = (s1_n_34 & s1_sbox_in[2]) ^ (s1_n_34 | s2_sbox_in[2]); 

//  NR2XD0 g12773__5122(.A1 (n_92), .A2 (n_61), .ZN (n_47));  
assign s1_n_47 = ~(s2_n_92 | s1_n_61) ^ (s2_n_92 & s2_n_61); 
assign s2_n_47 = (s1_n_92 & s1_n_61) ^ (s1_n_92 | s2_n_61); 

//  NR2XD0 g12877__8246(.A1 (n_412), .A2 (n_57), .ZN (n_46));  
assign s1_n_46 = ~(s2_n_412 | s1_n_57) ^ (s2_n_412 & s2_n_57); 
assign s2_n_46 = (s1_n_412 & s1_n_57) ^ (s1_n_412 | s2_n_57); 

//  NR2XD0 g12874__7098(.A1 (n_412), .A2 (n_42), .ZN (n_45));  
assign s1_n_45 = ~(s2_n_412 | s1_n_42) ^ (s2_n_412 & s2_n_42); 
assign s2_n_45 = (s1_n_412 & s1_n_42) ^ (s1_n_412 | s2_n_42); 

//  NR2D1 g12830__6131(.A1 (n_381), .A2 (n_113), .ZN (n_44));  
assign s1_n_44 = ~(s2_n_381 | s1_n_113) ^ (s2_n_381 & s2_n_113); 
assign s2_n_44 = (s1_n_381 & s1_n_113) ^ (s1_n_381 | s2_n_113); 

//  NR2XD0 g12832__1881(.A1 (n_366), .A2 (n_42), .ZN (n_43));  
assign s1_n_43 = ~(s2_n_366 | s1_n_42) ^ (s2_n_366 & s2_n_42); 
assign s2_n_43 = (s1_n_366 & s1_n_42) ^ (s1_n_366 | s2_n_42); 

//  NR2XD0 g12836__5115(.A1 (n_412), .A2 (n_30), .ZN (n_41));  
assign s1_n_41 = ~(s2_n_412 | s1_n_30) ^ (s2_n_412 & s2_n_30); 
assign s2_n_41 = (s1_n_412 & s1_n_30) ^ (s1_n_412 | s2_n_30); 

//  NR2XD0 g12872__7482(.A1 (n_381), .A2 (n_39), .ZN (n_40));  
assign s1_n_40 = ~(s2_n_381 | s1_n_39) ^ (s2_n_381 & s2_n_39); 
assign s2_n_40 = (s1_n_381 & s1_n_39) ^ (s1_n_381 | s2_n_39); 

//  ND2D1 g12869__4733(.A1 (n_401), .A2 (n_412), .ZN (n_38));  
assign s1_n_38 = ~(s1_n_401 & s1_n_412) ^ (s1_n_401 & s2_n_412); 
assign s2_n_38 = (s2_n_401 & s1_n_412) ^ (s2_n_401 & s2_n_412); 

//  NR2D1 g12886__6161(.A1 (n_401), .A2 (n_37), .ZN (n_379));  
assign s1_n_379 = ~(s2_n_401 | s1_n_37) ^ (s2_n_401 & s2_n_37); 
assign s2_n_379 = (s1_n_401 & s1_n_37) ^ (s1_n_401 | s2_n_37); 

//  INVD1 g12860(.I (n_36), .ZN (n_131));  
assign s1_n_131 = ~s1_n_36; 
assign s2_n_131 = s2_n_36; 

//  INVD1 g12859(.I (n_35), .ZN (n_133));  
assign s1_n_133 = ~s1_n_35; 
assign s2_n_133 = s2_n_35; 

//  ND2D1 g12887__9315(.A1 (n_355), .A2 (n_57), .ZN (n_556));  
assign s1_n_556 = ~(s1_n_355 & s1_n_57) ^ (s1_n_355 & s2_n_57); 
assign s2_n_556 = (s2_n_355 & s1_n_57) ^ (s2_n_355 & s2_n_57); 

//  INVD1 g12826(.I (n_117), .ZN (n_159));  
assign s1_n_159 = ~s1_n_117; 
assign s2_n_159 = s2_n_117; 

//  ND2D1 g12891__9945(.A1 (n_34), .A2 (n_33), .ZN (n_120));  
assign s1_n_120 = ~(s1_n_34 & s1_n_33) ^ (s1_n_34 & s2_n_33); 
assign s2_n_120 = (s2_n_34 & s1_n_33) ^ (s2_n_34 & s2_n_33); 

//  INVD1 g12862(.I (n_71), .ZN (n_128));  
assign s1_n_128 = ~s1_n_71; 
assign s2_n_128 = s2_n_71; 

//  INVD1 g12824(.I (n_70), .ZN (n_122));  
assign s1_n_122 = ~s1_n_70; 
assign s2_n_122 = s2_n_70; 

//  NR2D1 g12893__2883(.A1 (n_34), .A2 (n_33), .ZN (n_135));  
assign s1_n_135 = ~(s2_n_34 | s1_n_33) ^ (s2_n_34 & s2_n_33); 
assign s2_n_135 = (s1_n_34 & s1_n_33) ^ (s1_n_34 | s2_n_33); 

//  ND2D1 g12848__2346(.A1 (n_587), .A2 (n_729), .ZN (n_618));  
assign s1_n_618 = ~(s1_n_587 & s1_n_729) ^ (s1_n_587 & s2_n_729); 
assign s2_n_618 = (s2_n_587 & s1_n_729) ^ (s2_n_587 & s2_n_729); 

//  INVD1 g12865(.I (n_74), .ZN (n_181));  
assign s1_n_181 = ~s1_n_74; 
assign s2_n_181 = s2_n_74; 

//  NR2XD0 g12846__1666(.A1 (n_645), .A2 (sbox_in[3]), .ZN (n_654));  
assign s1_n_654 = ~(s2_n_645 | s1_sbox_in[3]) ^ (s2_n_645 & s2_sbox_in[3]); 
assign s2_n_654 = (s1_n_645 & s1_sbox_in[3]) ^ (s1_n_645 | s2_sbox_in[3]); 

//  NR2D1 g12894__7410(.A1 (n_34), .A2 (sbox_in[4]), .ZN (n_139));  
assign s1_n_139 = ~(s2_n_34 | s1_sbox_in[4]) ^ (s2_n_34 & s2_sbox_in[4]); 
assign s2_n_139 = (s1_n_34 & s1_sbox_in[4]) ^ (s1_n_34 | s2_sbox_in[4]); 

//  ND2D1 g12897__6417(.A1 (n_34), .A2 (sbox_in[4]), .ZN (n_143));  
assign s1_n_143 = ~(s1_n_34 & s1_sbox_in[4]) ^ (s1_n_34 & s2_sbox_in[4]); 
assign s2_n_143 = (s2_n_34 & s1_sbox_in[4]) ^ (s2_n_34 & s2_sbox_in[4]); 

//  INVD1 g12823(.I (n_119), .ZN (n_32));  
assign s1_n_32 = ~s1_n_119; 
assign s2_n_32 = s2_n_119; 

//  ND2D1 g12835__5477(.A1 (n_409), .A2 (n_30), .ZN (n_31));  
assign s1_n_31 = ~(s1_n_409 & s1_n_30) ^ (s1_n_409 & s2_n_30); 
assign s2_n_31 = (s2_n_409 & s1_n_30) ^ (s2_n_409 & s2_n_30); 

//  ND2D1 g12873__2398(.A1 (n_350), .A2 (n_28), .ZN (n_29));  
assign s1_n_29 = ~(s1_n_350 & s1_n_28) ^ (s1_n_350 & s2_n_28); 
assign s2_n_29 = (s2_n_350 & s1_n_28) ^ (s2_n_350 & s2_n_28); 

//  NR2XD0 g12882__5107(.A1 (n_118), .A2 (n_366), .ZN (n_27));  
assign s1_n_27 = ~(s2_n_118 | s1_n_366) ^ (s2_n_118 & s2_n_366); 
assign s2_n_27 = (s1_n_118 & s1_n_366) ^ (s1_n_118 | s2_n_366); 

//  ND2D1 g12834__6260(.A1 (n_118), .A2 (sbox_in[7]), .ZN (n_26));  
assign s1_n_26 = ~(s1_n_118 & s1_sbox_in[7]) ^ (s1_n_118 & s2_sbox_in[7]); 
assign s2_n_26 = (s2_n_118 & s1_sbox_in[7]) ^ (s2_n_118 & s2_sbox_in[7]); 

//  ND2D1 g12884__4319(.A1 (n_350), .A2 (n_61), .ZN (n_25));  
assign s1_n_25 = ~(s1_n_350 & s1_n_61) ^ (s1_n_350 & s2_n_61); 
assign s2_n_25 = (s2_n_350 & s1_n_61) ^ (s2_n_350 & s2_n_61); 

//  ND2D1 g12870__8428(.A1 (n_355), .A2 (n_22), .ZN (n_24));  
assign s1_n_24 = ~(s1_n_355 & s1_n_22) ^ (s1_n_355 & s2_n_22); 
assign s2_n_24 = (s2_n_355 & s1_n_22) ^ (s2_n_355 & s2_n_22); 

//  ND2D1 g12883__5526(.A1 (n_118), .A2 (n_451), .ZN (n_23));  
assign s1_n_23 = ~(s1_n_118 & s1_n_451) ^ (s1_n_118 & s2_n_451); 
assign s2_n_23 = (s2_n_118 & s1_n_451) ^ (s2_n_118 & s2_n_451); 

//  ND2D1 g12885__6783(.A1 (n_409), .A2 (n_52), .ZN (n_456));  
assign s1_n_456 = ~(s1_n_409 & s1_n_52) ^ (s1_n_409 & s2_n_52); 
assign s2_n_456 = (s2_n_409 & s1_n_52) ^ (s2_n_409 & s2_n_52); 

//  INVD1 g12820(.I (n_92), .ZN (n_87));  
assign s1_n_87 = ~s1_n_92; 
assign s2_n_87 = s2_n_92; 

//  INVD1 g12827(.I (n_185), .ZN (n_89));  
assign s1_n_89 = ~s1_n_185; 
assign s2_n_89 = s2_n_185; 

//  ND2D1 g12843__3680(.A1 (n_114), .A2 (n_175), .ZN (n_97));  
assign s1_n_97 = ~(s1_n_114 & s1_n_175) ^ (s1_n_114 & s2_n_175); 
assign s2_n_97 = (s2_n_114 & s1_n_175) ^ (s2_n_114 & s2_n_175); 

//  ND2D1 g12895__1617(.A1 (n_22), .A2 (n_33), .ZN (n_74));  
assign s1_n_74 = ~(s1_n_22 & s1_n_33) ^ (s1_n_22 & s2_n_33); 
assign s2_n_74 = (s2_n_22 & s1_n_33) ^ (s2_n_22 & s2_n_33); 

//  INVD1 g12822(.I (n_72), .ZN (n_109));  
assign s1_n_109 = ~s1_n_72; 
assign s2_n_109 = s2_n_72; 

//  NR2XD0 g12896__2802(.A1 (n_22), .A2 (n_33), .ZN (n_91));  
assign s1_n_91 = ~(s2_n_22 | s1_n_33) ^ (s2_n_22 & s2_n_33); 
assign s2_n_91 = (s1_n_22 & s1_n_33) ^ (s1_n_22 | s2_n_33); 

//  INVD1 g12825(.I (n_296), .ZN (n_116));  
assign s1_n_116 = ~s1_n_296; 
assign s2_n_116 = s2_n_296; 

//  INVD1 g12821(.I (n_103), .ZN (n_196));  
assign s1_n_196 = ~s1_n_103; 
assign s2_n_196 = s2_n_103; 

//  NR2XD0 g12849__1705(.A1 (n_629), .A2 (sbox_in[3]), .ZN (n_656));  
assign s1_n_656 = ~(s2_n_629 | s1_sbox_in[3]) ^ (s2_n_629 & s2_sbox_in[3]); 
assign s2_n_656 = (s1_n_629 & s1_sbox_in[3]) ^ (s1_n_629 | s2_sbox_in[3]); 

//  ND2D1 g12833__5122(.A1 (n_451), .A2 (n_52), .ZN (n_21));  
assign s1_n_21 = ~(s1_n_451 & s1_n_52) ^ (s1_n_451 & s2_n_52); 
assign s2_n_21 = (s2_n_451 & s1_n_52) ^ (s2_n_451 & s2_n_52); 

//  ND2D1 g12880__8246(.A1 (n_409), .A2 (n_19), .ZN (n_20));  
assign s1_n_20 = ~(s1_n_409 & s1_n_19) ^ (s1_n_409 & s2_n_19); 
assign s2_n_20 = (s2_n_409 & s1_n_19) ^ (s2_n_409 & s2_n_19); 

//  ND2D1 g12829__7098(.A1 (n_115), .A2 (n_451), .ZN (n_18));  
assign s1_n_18 = ~(s1_n_115 & s1_n_451) ^ (s1_n_115 & s2_n_451); 
assign s2_n_18 = (s2_n_115 & s1_n_451) ^ (s2_n_115 & s2_n_451); 

//  ND2D1 g12831__6131(.A1 (n_451), .A2 (sbox_in[0]), .ZN (n_17));  
assign s1_n_17 = ~(s1_n_451 & s1_sbox_in[0]) ^ (s1_n_451 & s2_sbox_in[0]); 
assign s2_n_17 = (s2_n_451 & s1_sbox_in[0]) ^ (s2_n_451 & s2_sbox_in[0]); 

//  ND2D1 g12839__1881(.A1 (n_409), .A2 (n_9), .ZN (n_16));  
assign s1_n_16 = ~(s1_n_409 & s1_n_9) ^ (s1_n_409 & s2_n_9); 
assign s2_n_16 = (s2_n_409 & s1_n_9) ^ (s2_n_409 & s2_n_9); 

//  ND2D1 g12828__5115(.A1 (n_14), .A2 (n_175), .ZN (n_15));  
assign s1_n_15 = ~(s1_n_14 & s1_n_175) ^ (s1_n_14 & s2_n_175); 
assign s2_n_15 = (s2_n_14 & s1_n_175) ^ (s2_n_14 & s2_n_175); 

//  NR2D1 g12840__7482(.A1 (n_366), .A2 (n_30), .ZN (n_13));  
assign s1_n_13 = ~(s2_n_366 | s1_n_30) ^ (s2_n_366 & s2_n_30); 
assign s2_n_13 = (s1_n_366 & s1_n_30) ^ (s1_n_366 | s2_n_30); 

//  NR2D1 g12875__4733(.A1 (n_22), .A2 (n_2), .ZN (n_12));  
assign s1_n_12 = ~(s2_n_22 | s1_n_2) ^ (s2_n_22 & s2_n_2); 
assign s2_n_12 = (s1_n_22 & s1_n_2) ^ (s1_n_22 | s2_n_2); 

//  ND2D1 g12871__6161(.A1 (n_409), .A2 (n_7), .ZN (n_11));  
assign s1_n_11 = ~(s1_n_409 & s1_n_7) ^ (s1_n_409 & s2_n_7); 
assign s2_n_11 = (s2_n_409 & s1_n_7) ^ (s2_n_409 & s2_n_7); 

//  NR2XD0 g12876__9315(.A1 (n_28), .A2 (n_61), .ZN (n_10));  
assign s1_n_10 = ~(s2_n_28 | s1_n_61) ^ (s2_n_28 & s2_n_61); 
assign s2_n_10 = (s1_n_28 & s1_n_61) ^ (s1_n_28 | s2_n_61); 

//  ND2D1 g12842__9945(.A1 (n_355), .A2 (n_3), .ZN (n_431));  
assign s1_n_431 = ~(s1_n_355 & s1_n_3) ^ (s1_n_355 & s2_n_3); 
assign s2_n_431 = (s2_n_355 & s1_n_3) ^ (s2_n_355 & s2_n_3); 

//  ND2D1 g12889__2883(.A1 (n_113), .A2 (n_175), .ZN (n_35));  
assign s1_n_35 = ~(s1_n_113 & s1_n_175) ^ (s1_n_113 & s2_n_175); 
assign s2_n_35 = (s2_n_113 & s1_n_175) ^ (s2_n_113 & s2_n_175); 

//  ND2D1 g12890__2346(.A1 (n_14), .A2 (n_37), .ZN (n_36));  
assign s1_n_36 = ~(s1_n_14 & s1_n_37) ^ (s1_n_14 & s2_n_37); 
assign s2_n_36 = (s2_n_14 & s1_n_37) ^ (s2_n_14 & s2_n_37); 

//  ND2D1 g12892__1666(.A1 (n_22), .A2 (sbox_in[4]), .ZN (n_71));  
assign s1_n_71 = ~(s1_n_22 & s1_sbox_in[4]) ^ (s1_n_22 & s2_sbox_in[4]); 
assign s2_n_71 = (s2_n_22 & s1_sbox_in[4]) ^ (s2_n_22 & s2_sbox_in[4]); 

//  INVD1 g12817(.I (n_598), .ZN (n_641));  
assign s1_n_641 = ~s1_n_598; 
assign s2_n_641 = s2_n_598; 

//  NR2XD0 g12845__7410(.A1 (n_22), .A2 (n_52), .ZN (n_105));  
assign s1_n_105 = ~(s2_n_22 | s1_n_52) ^ (s2_n_22 & s2_n_52); 
assign s2_n_105 = (s1_n_22 & s1_n_52) ^ (s1_n_22 | s2_n_52); 

//  ND2D1 g12854__6417(.A1 (n_4), .A2 (n_6), .ZN (n_70));  
assign s1_n_70 = ~(s1_n_4 & s1_n_6) ^ (s1_n_4 & s2_n_6); 
assign s2_n_70 = (s2_n_4 & s1_n_6) ^ (s2_n_4 & s2_n_6); 

//  ND2D1 g12856__5477(.A1 (n_9), .A2 (n_33), .ZN (n_117));  
assign s1_n_117 = ~(s1_n_9 & s1_n_33) ^ (s1_n_9 & s2_n_33); 
assign s2_n_117 = (s2_n_9 & s1_n_33) ^ (s2_n_9 & s2_n_33); 

//  NR2XD0 g12898__2398(.A1 (n_22), .A2 (sbox_in[4]), .ZN (n_93));  
assign s1_n_93 = ~(s2_n_22 | s1_sbox_in[4]) ^ (s2_n_22 & s2_sbox_in[4]); 
assign s2_n_93 = (s1_n_22 & s1_sbox_in[4]) ^ (s1_n_22 | s2_sbox_in[4]); 

//  NR2XD0 g12838__5107(.A1 (n_30), .A2 (n_396), .ZN (n_8));  
assign s1_n_8 = ~(s2_n_30 | s1_n_396) ^ (s2_n_30 & s2_n_396); 
assign s2_n_8 = (s1_n_30 & s1_n_396) ^ (s1_n_30 | s2_n_396); 

//  INVD1 g12920(.I (n_114), .ZN (n_50));  
assign s1_n_50 = ~s1_n_114; 
assign s2_n_50 = s2_n_114; 

//  NR2XD0 g12847__6260(.A1 (n_663), .A2 (sbox_in[3]), .ZN (n_598));  
assign s1_n_598 = ~(s2_n_663 | s1_sbox_in[3]) ^ (s2_n_663 & s2_sbox_in[3]); 
assign s2_n_598 = (s1_n_663 & s1_sbox_in[3]) ^ (s1_n_663 | s2_sbox_in[3]); 

//  ND2D1 g12851__4319(.A1 (n_30), .A2 (n_33), .ZN (n_103));  
assign s1_n_103 = ~(s1_n_30 & s1_n_33) ^ (s1_n_30 & s2_n_33); 
assign s2_n_103 = (s2_n_30 & s1_n_33) ^ (s2_n_30 & s2_n_33); 

//  INVD1 g12921(.I (n_7), .ZN (n_34));  
assign s1_n_34 = ~s1_n_7; 
assign s2_n_34 = s2_n_7; 

//  INVD1 g12923(.I (n_28), .ZN (n_57));  
assign s1_n_57 = ~s1_n_28; 
assign s2_n_57 = s2_n_28; 

//  NR2D0 g12850__8428(.A1 (n_30), .A2 (n_33), .ZN (n_92));  
assign s1_n_92 = ~(s2_n_30 | s1_n_33) ^ (s2_n_30 & s2_n_33); 
assign s2_n_92 = (s1_n_30 & s1_n_33) ^ (s1_n_30 | s2_n_33); 

//  INVD1 g12925(.I (n_627), .ZN (n_645));  
assign s1_n_645 = ~s1_n_627; 
assign s2_n_645 = s2_n_627; 

//  NR2XD0 g12857__5526(.A1 (n_6), .A2 (n_33), .ZN (n_185));  
assign s1_n_185 = ~(s2_n_6 | s1_n_33) ^ (s2_n_6 & s2_n_33); 
assign s2_n_185 = (s1_n_6 & s1_n_33) ^ (s1_n_6 | s2_n_33); 

//  INVD1 g12908(.I (n_451), .ZN (n_381));  
assign s1_n_381 = ~s1_n_451; 
assign s2_n_381 = s2_n_451; 

//  ND2D1 g12881__6783(.A1 (n_350), .A2 (n_175), .ZN (n_5));  
assign s1_n_5 = ~(s1_n_350 & s1_n_175) ^ (s1_n_350 & s2_n_175); 
assign s2_n_5 = (s2_n_350 & s1_n_175) ^ (s2_n_350 & s2_n_175); 

//  INVD1 g12922(.I (n_61), .ZN (n_39));  
assign s1_n_39 = ~s1_n_61; 
assign s2_n_39 = s2_n_61; 

//  INVD1 g12900(.I (n_113), .ZN (n_42));  
assign s1_n_42 = ~s1_n_113; 
assign s2_n_42 = s2_n_113; 

//  INVD1 g12924(.I (n_660), .ZN (n_587));  
assign s1_n_587 = ~s1_n_660; 
assign s2_n_587 = s2_n_660; 

//  ND2D1 g12852__3680(.A1 (n_6), .A2 (sbox_in[4]), .ZN (n_72));  
assign s1_n_72 = ~(s1_n_6 & s1_sbox_in[4]) ^ (s1_n_6 & s2_sbox_in[4]); 
assign s2_n_72 = (s2_n_6 & s1_sbox_in[4]) ^ (s2_n_6 & s2_sbox_in[4]); 

//  ND2D1 g12844__1617(.A1 (n_6), .A2 (n_33), .ZN (n_64));  
assign s1_n_64 = ~(s1_n_6 & s1_n_33) ^ (s1_n_6 & s2_n_33); 
assign s2_n_64 = (s2_n_6 & s1_n_33) ^ (s2_n_6 & s2_n_33); 

//  NR2XD0 g12855__2802(.A1 (n_30), .A2 (sbox_in[4]), .ZN (n_296));  
assign s1_n_296 = ~(s2_n_30 | s1_sbox_in[4]) ^ (s2_n_30 & s2_sbox_in[4]); 
assign s2_n_296 = (s1_n_30 & s1_sbox_in[4]) ^ (s1_n_30 | s2_sbox_in[4]); 

//  ND2D1 g12853__1705(.A1 (n_30), .A2 (sbox_in[4]), .ZN (n_119));  
assign s1_n_119 = ~(s1_n_30 & s1_sbox_in[4]) ^ (s1_n_30 & s2_sbox_in[4]); 
assign s2_n_119 = (s2_n_30 & s1_sbox_in[4]) ^ (s2_n_30 & s2_sbox_in[4]); 

//  INVD1 g12926(.I (n_355), .ZN (n_412));  
assign s1_n_412 = ~s1_n_355; 
assign s2_n_412 = s2_n_355; 

//  INVD1 g12927(.I (n_409), .ZN (n_401));  
assign s1_n_401 = ~s1_n_409; 
assign s2_n_401 = s2_n_409; 

//  INVD1 g12903(.I (n_30), .ZN (n_4));  
assign s1_n_4 = ~s1_n_30; 
assign s2_n_4 = s2_n_30; 

//  INVD1 g12899(.I (n_6), .ZN (n_9));  
assign s1_n_9 = ~s1_n_6; 
assign s2_n_9 = s2_n_6; 

//  INVD1 g12905(.I (n_663), .ZN (n_610));  
assign s1_n_610 = ~s1_n_663; 
assign s2_n_610 = s2_n_663; 

//  NR2D1 g12930__5122(.A1 (n_33), .A2 (sbox_in[0]), .ZN (n_118));  
assign s1_n_118 = ~(s2_n_33 | s1_sbox_in[0]) ^ (s2_n_33 & s2_sbox_in[0]); 
assign s2_n_118 = (s1_n_33 & s1_sbox_in[0]) ^ (s1_n_33 | s2_sbox_in[0]); 

//  INVD1 g12902(.I (n_37), .ZN (n_115));  
assign s1_n_115 = ~s1_n_37; 
assign s2_n_115 = s2_n_37; 

//  NR2XD0 g12934__8246(.A1 (n_3), .A2 (sbox_in[4]), .ZN (n_61));  
assign s1_n_61 = ~(s2_n_3 | s1_sbox_in[4]) ^ (s2_n_3 & s2_sbox_in[4]); 
assign s2_n_61 = (s1_n_3 & s1_sbox_in[4]) ^ (s1_n_3 | s2_sbox_in[4]); 

//  NR2D1 g12937__7098(.A1 (n_639), .A2 (sbox_in[6]), .ZN (n_627));  
assign s1_n_627 = ~(s2_n_639 | s1_sbox_in[6]) ^ (s2_n_639 & s2_sbox_in[6]); 
assign s2_n_627 = (s1_n_639 & s1_sbox_in[6]) ^ (s1_n_639 | s2_sbox_in[6]); 

//  INVD1 g12906(.I (n_649), .ZN (n_629));  
assign s1_n_629 = ~s1_n_649; 
assign s2_n_629 = s2_n_649; 

//  ND2D1 g12936__6131(.A1 (n_639), .A2 (sbox_in[6]), .ZN (n_660));  
assign s1_n_660 = ~(s1_n_639 & s1_sbox_in[6]) ^ (s1_n_639 & s2_sbox_in[6]); 
assign s2_n_660 = (s2_n_639 & s1_sbox_in[6]) ^ (s2_n_639 & s2_sbox_in[6]); 

//  AN2XD1 g12938__1881(.A1 (n_304), .A2 (sbox_in[7]), .Z (n_355));  
assign s1_n_355 = (s1_n_304 & s1_sbox_in[7]) ^ (s1_n_304 & s2_sbox_in[7]); 
assign s2_n_355 = (s2_n_304 & s1_sbox_in[7]) ^ (s2_n_304 & s2_sbox_in[7]); 

//  NR2XD0 g12928__5115(.A1 (n_33), .A2 (sbox_in[2]), .ZN (n_2));  
assign s1_n_2 = ~(s2_n_33 | s1_sbox_in[2]) ^ (s2_n_33 & s2_sbox_in[2]); 
assign s2_n_2 = (s1_n_33 & s1_sbox_in[2]) ^ (s1_n_33 | s2_sbox_in[2]); 

//  INVD1 g12904(.I (n_175), .ZN (n_19));  
assign s1_n_19 = ~s1_n_175; 
assign s2_n_19 = s2_n_175; 

//  ND2D1 g12932__7482(.A1 (n_3), .A2 (sbox_in[1]), .ZN (n_7));  
assign s1_n_7 = ~(s1_n_3 & s1_sbox_in[1]) ^ (s1_n_3 & s2_sbox_in[1]); 
assign s2_n_7 = (s2_n_3 & s1_sbox_in[1]) ^ (s2_n_3 & s2_sbox_in[1]); 

//  INVD1 g12901(.I (n_52), .ZN (n_14));  
assign s1_n_14 = ~s1_n_52; 
assign s2_n_14 = s2_n_52; 

//  NR2D0 g12935__4733(.A1 (n_33), .A2 (sbox_in[1]), .ZN (n_28));  
assign s1_n_28 = ~(s2_n_33 | s1_sbox_in[1]) ^ (s2_n_33 & s2_sbox_in[1]); 
assign s2_n_28 = (s1_n_33 & s1_sbox_in[1]) ^ (s1_n_33 | s2_sbox_in[1]); 

//  ND2D1 g12931__6161(.A1 (n_33), .A2 (sbox_in[1]), .ZN (n_114));  
assign s1_n_114 = ~(s1_n_33 & s1_sbox_in[1]) ^ (s1_n_33 & s2_sbox_in[1]); 
assign s2_n_114 = (s2_n_33 & s1_sbox_in[1]) ^ (s2_n_33 & s2_sbox_in[1]); 

//  ND2D1 g12911__9315(.A1 (n_33), .A2 (n_3), .ZN (n_113));  
assign s1_n_113 = ~(s1_n_33 & s1_n_3) ^ (s1_n_33 & s2_n_3); 
assign s2_n_113 = (s2_n_33 & s1_n_3) ^ (s2_n_33 & s2_n_3); 

//  NR2XD0 g12933__9945(.A1 (n_3), .A2 (sbox_in[1]), .ZN (n_22));  
assign s1_n_22 = ~(s2_n_3 | s1_sbox_in[1]) ^ (s2_n_3 & s2_sbox_in[1]); 
assign s2_n_22 = (s1_n_3 & s1_sbox_in[1]) ^ (s1_n_3 | s2_sbox_in[1]); 

//  INVD1 g12907(.I (n_350), .ZN (n_366));  
assign s1_n_366 = ~s1_n_350; 
assign s2_n_366 = s2_n_350; 

//  AN2XD1 g12919__2883(.A1 (n_304), .A2 (n_396), .Z (n_451));  
assign s1_n_451 = (s1_n_304 & s1_n_396) ^ (s1_n_304 & s2_n_396); 
assign s2_n_451 = (s2_n_304 & s1_n_396) ^ (s2_n_304 & s2_n_396); 

//  AN2XD1 g12939__2346(.A1 (n_396), .A2 (sbox_in[2]), .Z (n_409));  
assign s1_n_409 = (s1_n_396 & s1_sbox_in[2]) ^ (s1_n_396 & s2_sbox_in[2]); 
assign s2_n_409 = (s2_n_396 & s1_sbox_in[2]) ^ (s2_n_396 & s2_sbox_in[2]); 

//  NR2XD0 g12912__1666(.A1 (sbox_in[4]), .A2 (sbox_in[1]), .ZN (n_52));  
assign s1_n_52 = ~(s2_sbox_in[4] | s1_sbox_in[1]) ^ (s2_sbox_in[4] & s2_sbox_in[1]); 
assign s2_n_52 = (s1_sbox_in[4] & s1_sbox_in[1]) ^ (s1_sbox_in[4] | s2_sbox_in[1]); 

//  NR2XD0 g12917__7410(.A1 (sbox_in[6]), .A2 (sbox_in[5]), .ZN (n_649));  
assign s1_n_649 = ~(s2_sbox_in[6] | s1_sbox_in[5]) ^ (s2_sbox_in[6] & s2_sbox_in[5]); 
assign s2_n_649 = (s1_sbox_in[6] & s1_sbox_in[5]) ^ (s1_sbox_in[6] | s2_sbox_in[5]); 

//  ND2D1 g12915__6417(.A1 (sbox_in[4]), .A2 (sbox_in[0]), .ZN (n_175));  
assign s1_n_175 = ~(s1_sbox_in[4] & s1_sbox_in[0]) ^ (s1_sbox_in[4] & s2_sbox_in[0]); 
assign s2_n_175 = (s2_sbox_in[4] & s1_sbox_in[0]) ^ (s2_sbox_in[4] & s2_sbox_in[0]); 

//  ND2D1 g12916__5477(.A1 (sbox_in[6]), .A2 (sbox_in[5]), .ZN (n_663));  
assign s1_n_663 = ~(s1_sbox_in[6] & s1_sbox_in[5]) ^ (s1_sbox_in[6] & s2_sbox_in[5]); 
assign s2_n_663 = (s2_sbox_in[6] & s1_sbox_in[5]) ^ (s2_sbox_in[6] & s2_sbox_in[5]); 

//  AN2XD1 g12918__2398(.A1 (sbox_in[7]), .A2 (sbox_in[2]), .Z (n_350));  
assign s1_n_350 = (s1_sbox_in[7] & s1_sbox_in[2]) ^ (s1_sbox_in[7] & s2_sbox_in[2]); 
assign s2_n_350 = (s2_sbox_in[7] & s1_sbox_in[2]) ^ (s2_sbox_in[7] & s2_sbox_in[2]); 

//  NR2XD0 g12929__5107(.A1 (sbox_in[7]), .A2 (sbox_in[4]), .ZN (n_1));  
assign s1_n_1 = ~(s2_sbox_in[7] | s1_sbox_in[4]) ^ (s2_sbox_in[7] & s2_sbox_in[4]); 
assign s2_n_1 = (s1_sbox_in[7] & s1_sbox_in[4]) ^ (s1_sbox_in[7] | s2_sbox_in[4]); 

//  ND2D1 g12909__6260(.A1 (sbox_in[7]), .A2 (sbox_in[5]), .ZN (n_145));  
assign s1_n_145 = ~(s1_sbox_in[7] & s1_sbox_in[5]) ^ (s1_sbox_in[7] & s2_sbox_in[5]); 
assign s2_n_145 = (s2_sbox_in[7] & s1_sbox_in[5]) ^ (s2_sbox_in[7] & s2_sbox_in[5]); 

//  ND2D1 g12913__4319(.A1 (sbox_in[4]), .A2 (sbox_in[1]), .ZN (n_37));  
assign s1_n_37 = ~(s1_sbox_in[4] & s1_sbox_in[1]) ^ (s1_sbox_in[4] & s2_sbox_in[1]); 
assign s2_n_37 = (s2_sbox_in[4] & s1_sbox_in[1]) ^ (s2_sbox_in[4] & s2_sbox_in[1]); 

//  ND2D1 g12910__8428(.A1 (sbox_in[1]), .A2 (sbox_in[0]), .ZN (n_6));  
assign s1_n_6 = ~(s1_sbox_in[1] & s1_sbox_in[0]) ^ (s1_sbox_in[1] & s2_sbox_in[0]); 
assign s2_n_6 = (s2_sbox_in[1] & s1_sbox_in[0]) ^ (s2_sbox_in[1] & s2_sbox_in[0]); 

//  NR2XD0 g12914__5526(.A1 (sbox_in[1]), .A2 (sbox_in[0]), .ZN (n_30));  
assign s1_n_30 = ~(s2_sbox_in[1] | s1_sbox_in[0]) ^ (s2_sbox_in[1] & s2_sbox_in[0]); 
assign s2_n_30 = (s1_sbox_in[1] & s1_sbox_in[0]) ^ (s1_sbox_in[1] | s2_sbox_in[0]); 

//  INVD1 g12941(.I (sbox_in[2]), .ZN (n_304));  
assign s1_n_304 = ~s1_sbox_in[2]; 
assign s2_n_304 = s2_sbox_in[2]; 

//  INVD1 g12944(.I (sbox_in[7]), .ZN (n_396));  
assign s1_n_396 = ~s1_sbox_in[7]; 
assign s2_n_396 = s2_sbox_in[7]; 

//  INVD1 g12946(.I (sbox_in[4]), .ZN (n_33));  
assign s1_n_33 = ~s1_sbox_in[4]; 
assign s2_n_33 = s2_sbox_in[4]; 

//  INVD1 g12943(.I (sbox_in[6]), .ZN (n_0));  
assign s1_n_0 = ~s1_sbox_in[6]; 
assign s2_n_0 = s2_sbox_in[6]; 

//  INVD1 g12940(.I (sbox_in[0]), .ZN (n_3));  
assign s1_n_3 = ~s1_sbox_in[0]; 
assign s2_n_3 = s2_sbox_in[0]; 

//  INVD1 g12945(.I (sbox_in[5]), .ZN (n_639));  
assign s1_n_639 = ~s1_sbox_in[5]; 
assign s2_n_639 = s2_sbox_in[5]; 

//  INVD1 g12942(.I (sbox_in[3]), .ZN (n_729));  
assign s1_n_729 = ~s1_sbox_in[3]; 
assign s2_n_729 = s2_sbox_in[3]; 

endmodule 
