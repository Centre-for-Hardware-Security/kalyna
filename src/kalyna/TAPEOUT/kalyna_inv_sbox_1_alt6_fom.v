module kalyna_inv_sbox_1_alt6_fom (s1_sbox_in, s2_sbox_in, s1_sbox_out, s2_sbox_out); 

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
wire s1_n_738, s2_n_738; 
wire s1_n_739, s2_n_739; 
wire s1_n_740, s2_n_740; 
wire s1_n_741, s2_n_741; 
wire s1_n_742, s2_n_742; 
wire s1_n_743, s2_n_743; 
wire s1_n_744, s2_n_744; 
wire s1_n_745, s2_n_745; 
wire s1_n_746, s2_n_746; 
wire s1_n_747, s2_n_747; 
wire s1_n_748, s2_n_748; 
wire s1_n_749, s2_n_749; 
wire s1_n_751, s2_n_751; 
wire s1_n_752, s2_n_752; 
wire s1_n_753, s2_n_753; 
wire s1_n_754, s2_n_754; 
wire s1_n_757, s2_n_757; 
wire s1_n_758, s2_n_758; 
wire s1_n_759, s2_n_759; 
wire s1_n_760, s2_n_760; 
wire s1_n_762, s2_n_762; 
wire s1_n_763, s2_n_763; 
wire s1_n_765, s2_n_765; 

//  ND2D0 g10839__2398(.A1 (n_765), .A2 (n_545), .ZN (sbox_out[0]));  
assign s1_sbox_out[0] = ~(s1_n_765 & s1_n_545) ^ (s1_n_765 & s2_n_545); 
assign s2_sbox_out[0] = (s2_n_765 & s1_n_545) ^ (s2_n_765 & s2_n_545); 

//  ND2D0 g10843__5107(.A1 (n_763), .A2 (n_564), .ZN (sbox_out[4]));  
assign s1_sbox_out[4] = ~(s1_n_763 & s1_n_564) ^ (s1_n_763 & s2_n_564); 
assign s2_sbox_out[4] = (s2_n_763 & s1_n_564) ^ (s2_n_763 & s2_n_564); 

//  ND2D1 g10842__6260(.A1 (n_762), .A2 (n_650), .ZN (sbox_out[1]));  
assign s1_sbox_out[1] = ~(s1_n_762 & s1_n_650) ^ (s1_n_762 & s2_n_650); 
assign s2_sbox_out[1] = (s2_n_762 & s1_n_650) ^ (s2_n_762 & s2_n_650); 

//  NR2XD0 g10840__4319(.A1 (n_759), .A2 (n_740), .ZN (n_765));  
assign s1_n_765 = ~(s2_n_759 | s1_n_740) ^ (s2_n_759 & s2_n_740); 
assign s2_n_765 = (s1_n_759 & s1_n_740) ^ (s1_n_759 | s2_n_740); 

//  ND2D0 g10841__8428(.A1 (n_760), .A2 (n_664), .ZN (sbox_out[5]));  
assign s1_sbox_out[5] = ~(s1_n_760 & s1_n_664) ^ (s1_n_760 & s2_n_664); 
assign s2_sbox_out[5] = (s2_n_760 & s1_n_664) ^ (s2_n_760 & s2_n_664); 

//  NR2D1 g10847__5526(.A1 (n_757), .A2 (n_742), .ZN (n_763));  
assign s1_n_763 = ~(s2_n_757 | s1_n_742) ^ (s2_n_757 & s2_n_742); 
assign s2_n_763 = (s1_n_757 & s1_n_742) ^ (s1_n_757 | s2_n_742); 

//  NR2D1 g10846__6783(.A1 (n_758), .A2 (n_599), .ZN (n_762));  
assign s1_n_762 = ~(s2_n_758 | s1_n_599) ^ (s2_n_758 & s2_n_599); 
assign s2_n_762 = (s1_n_758 & s1_n_599) ^ (s1_n_758 | s2_n_599); 

//  OR2XD1 g10850__3680(.A1 (n_754), .A2 (n_709), .Z (sbox_out[7]));  
assign s1_sbox_out[7] = (s2_n_754 | s1_n_709) ^ (s2_n_754 & s2_n_709); 
assign s2_sbox_out[7] = (s1_n_754 & s1_n_709) ^ (s1_n_754 | s2_n_709); 

//  NR2D1 g10845__1617(.A1 (n_751), .A2 (n_730), .ZN (n_760));  
assign s1_n_760 = ~(s2_n_751 | s1_n_730) ^ (s2_n_751 & s2_n_730); 
assign s2_n_760 = (s1_n_751 & s1_n_730) ^ (s1_n_751 | s2_n_730); 

//  NR2D1 g10844__2802(.A1 (n_752), .A2 (sbox_in[4]), .ZN (n_759));  
assign s1_n_759 = ~(s2_n_752 | s1_sbox_in[4]) ^ (s2_n_752 & s2_sbox_in[4]); 
assign s2_n_759 = (s1_n_752 & s1_sbox_in[4]) ^ (s1_n_752 | s2_sbox_in[4]); 

//  ND2D1 g10848__1705(.A1 (n_749), .A2 (n_687), .ZN (n_758));  
assign s1_n_758 = ~(s1_n_749 & s1_n_687) ^ (s1_n_749 & s2_n_687); 
assign s2_n_758 = (s2_n_749 & s1_n_687) ^ (s2_n_749 & s2_n_687); 

//  NR2XD0 g10853__5122(.A1 (n_748), .A2 (n_753), .ZN (n_757));  
assign s1_n_757 = ~(s2_n_748 | s1_n_753) ^ (s2_n_748 & s2_n_753); 
assign s2_n_757 = (s1_n_748 & s1_n_753) ^ (s1_n_748 | s2_n_753); 

//  ND2D0 g10851__8246(.A1 (n_747), .A2 (n_725), .ZN (sbox_out[3]));  
assign s1_sbox_out[3] = ~(s1_n_747 & s1_n_725) ^ (s1_n_747 & s2_n_725); 
assign s2_sbox_out[3] = (s2_n_747 & s1_n_725) ^ (s2_n_747 & s2_n_725); 

//  ND2D0 g10860__7098(.A1 (n_746), .A2 (n_735), .ZN (sbox_out[2]));  
assign s1_sbox_out[2] = ~(s1_n_746 & s1_n_735) ^ (s1_n_746 & s2_n_735); 
assign s2_sbox_out[2] = (s2_n_746 & s1_n_735) ^ (s2_n_746 & s2_n_735); 

//  NR2XD0 g10859__6131(.A1 (n_744), .A2 (n_753), .ZN (n_754));  
assign s1_n_754 = ~(s2_n_744 | s1_n_753) ^ (s2_n_744 & s2_n_753); 
assign s2_n_754 = (s1_n_744 & s1_n_753) ^ (s1_n_744 | s2_n_753); 

//  NR2XD0 g10849__1881(.A1 (n_745), .A2 (n_595), .ZN (n_752));  
assign s1_n_752 = ~(s2_n_745 | s1_n_595) ^ (s2_n_745 & s2_n_595); 
assign s2_n_752 = (s1_n_745 & s1_n_595) ^ (s1_n_745 | s2_n_595); 

//  ND2D1 g10852__5115(.A1 (n_743), .A2 (n_612), .ZN (n_751));  
assign s1_n_751 = ~(s1_n_743 & s1_n_612) ^ (s1_n_743 & s2_n_612); 
assign s2_n_751 = (s2_n_743 & s1_n_612) ^ (s2_n_743 & s2_n_612); 

//  ND2D0 g10857__7482(.A1 (n_738), .A2 (n_633), .ZN (sbox_out[6]));  
assign s1_sbox_out[6] = ~(s1_n_738 & s1_n_633) ^ (s1_n_738 & s2_n_633); 
assign s2_sbox_out[6] = (s2_n_738 & s1_n_633) ^ (s2_n_738 & s2_n_633); 

//  ND2D1 g10856__4733(.A1 (n_741), .A2 (sbox_in[4]), .ZN (n_749));  
assign s1_n_749 = ~(s1_n_741 & s1_sbox_in[4]) ^ (s1_n_741 & s2_sbox_in[4]); 
assign s2_n_749 = (s2_n_741 & s1_sbox_in[4]) ^ (s2_n_741 & s2_sbox_in[4]); 

//  NR2D1 g10858__6161(.A1 (n_739), .A2 (n_161), .ZN (n_748));  
assign s1_n_748 = ~(s2_n_739 | s1_n_161) ^ (s2_n_739 & s2_n_161); 
assign s2_n_748 = (s1_n_739 & s1_n_161) ^ (s1_n_739 | s2_n_161); 

//  NR2D1 g10854__9315(.A1 (n_733), .A2 (n_632), .ZN (n_747));  
assign s1_n_747 = ~(s2_n_733 | s1_n_632) ^ (s2_n_733 & s2_n_632); 
assign s2_n_747 = (s1_n_733 & s1_n_632) ^ (s1_n_733 | s2_n_632); 

//  NR2D1 g10868__9945(.A1 (n_732), .A2 (n_537), .ZN (n_746));  
assign s1_n_746 = ~(s2_n_732 | s1_n_537) ^ (s2_n_732 & s2_n_537); 
assign s2_n_746 = (s1_n_732 & s1_n_537) ^ (s1_n_732 | s2_n_537); 

//  ND2D1 g10855__2883(.A1 (n_734), .A2 (n_662), .ZN (n_745));  
assign s1_n_745 = ~(s1_n_734 & s1_n_662) ^ (s1_n_734 & s2_n_662); 
assign s2_n_745 = (s2_n_734 & s1_n_662) ^ (s2_n_734 & s2_n_662); 

//  NR2D1 g10869__2346(.A1 (n_731), .A2 (n_364), .ZN (n_744));  
assign s1_n_744 = ~(s2_n_731 | s1_n_364) ^ (s2_n_731 & s2_n_364); 
assign s2_n_744 = (s1_n_731 & s1_n_364) ^ (s1_n_731 | s2_n_364); 

//  ND2D1 g10861__1666(.A1 (n_736), .A2 (sbox_in[4]), .ZN (n_743));  
assign s1_n_743 = ~(s1_n_736 & s1_sbox_in[4]) ^ (s1_n_736 & s2_sbox_in[4]); 
assign s2_n_743 = (s2_n_736 & s1_sbox_in[4]) ^ (s2_n_736 & s2_sbox_in[4]); 

//  ND2D1 g10862__7410(.A1 (n_737), .A2 (n_616), .ZN (n_742));  
assign s1_n_742 = ~(s1_n_737 & s1_n_616) ^ (s1_n_737 & s2_n_616); 
assign s2_n_742 = (s2_n_737 & s1_n_616) ^ (s2_n_737 & s2_n_616); 

//  ND2D1 g10866__6417(.A1 (n_727), .A2 (n_644), .ZN (n_741));  
assign s1_n_741 = ~(s1_n_727 & s1_n_644) ^ (s1_n_727 & s2_n_644); 
assign s2_n_741 = (s2_n_727 & s1_n_644) ^ (s2_n_727 & s2_n_644); 

//  ND2D1 g10867__5477(.A1 (n_729), .A2 (n_579), .ZN (n_740));  
assign s1_n_740 = ~(s1_n_729 & s1_n_579) ^ (s1_n_729 & s2_n_579); 
assign s2_n_740 = (s2_n_729 & s1_n_579) ^ (s2_n_729 & s2_n_579); 

//  ND2D1 g10870__2398(.A1 (n_728), .A2 (n_391), .ZN (n_739));  
assign s1_n_739 = ~(s1_n_728 & s1_n_391) ^ (s1_n_728 & s2_n_391); 
assign s2_n_739 = (s2_n_728 & s1_n_391) ^ (s2_n_728 & s2_n_391); 

//  NR2D1 g10863__5107(.A1 (n_726), .A2 (n_694), .ZN (n_738));  
assign s1_n_738 = ~(s2_n_726 | s1_n_694) ^ (s2_n_726 & s2_n_694); 
assign s2_n_738 = (s1_n_726 & s1_n_694) ^ (s1_n_726 | s2_n_694); 

//  ND2D1 g10871__6260(.A1 (n_719), .A2 (n_753), .ZN (n_737));  
assign s1_n_737 = ~(s1_n_719 & s1_n_753) ^ (s1_n_719 & s2_n_753); 
assign s2_n_737 = (s2_n_719 & s1_n_753) ^ (s2_n_719 & s2_n_753); 

//  ND2D1 g10872__4319(.A1 (n_720), .A2 (n_704), .ZN (n_736));  
assign s1_n_736 = ~(s1_n_720 & s1_n_704) ^ (s1_n_720 & s2_n_704); 
assign s2_n_736 = (s2_n_720 & s1_n_704) ^ (s2_n_720 & s2_n_704); 

//  NR2D1 g10873__8428(.A1 (n_718), .A2 (n_697), .ZN (n_735));  
assign s1_n_735 = ~(s2_n_718 | s1_n_697) ^ (s2_n_718 & s2_n_697); 
assign s2_n_735 = (s1_n_718 & s1_n_697) ^ (s1_n_718 | s2_n_697); 

//  ND2D1 g10865__5526(.A1 (n_722), .A2 (sbox_in[6]), .ZN (n_734));  
assign s1_n_734 = ~(s1_n_722 & s1_sbox_in[6]) ^ (s1_n_722 & s2_sbox_in[6]); 
assign s2_n_734 = (s2_n_722 & s1_sbox_in[6]) ^ (s2_n_722 & s2_sbox_in[6]); 

//  OR2XD1 g10864__6783(.A1 (n_721), .A2 (n_676), .Z (n_733));  
assign s1_n_733 = (s2_n_721 | s1_n_676) ^ (s2_n_721 & s2_n_676); 
assign s2_n_733 = (s1_n_721 & s1_n_676) ^ (s1_n_721 | s2_n_676); 

//  NR2XD0 g10880__3680(.A1 (n_723), .A2 (sbox_in[4]), .ZN (n_732));  
assign s1_n_732 = ~(s2_n_723 | s1_sbox_in[4]) ^ (s2_n_723 & s2_sbox_in[4]); 
assign s2_n_732 = (s1_n_723 & s1_sbox_in[4]) ^ (s1_n_723 | s2_sbox_in[4]); 

//  ND2D1 g10885__1617(.A1 (n_724), .A2 (n_366), .ZN (n_731));  
assign s1_n_731 = ~(s1_n_724 & s1_n_366) ^ (s1_n_724 & s2_n_366); 
assign s2_n_731 = (s2_n_724 & s1_n_366) ^ (s2_n_724 & s2_n_366); 

//  AN2XD1 g10874__2802(.A1 (n_715), .A2 (n_753), .Z (n_730));  
assign s1_n_730 = (s1_n_715 & s1_n_753) ^ (s1_n_715 & s2_n_753); 
assign s2_n_730 = (s2_n_715 & s1_n_753) ^ (s2_n_715 & s2_n_753); 

//  ND2D1 g10879__1705(.A1 (n_717), .A2 (sbox_in[4]), .ZN (n_729));  
assign s1_n_729 = ~(s1_n_717 & s1_sbox_in[4]) ^ (s1_n_717 & s2_sbox_in[4]); 
assign s2_n_729 = (s2_n_717 & s1_sbox_in[4]) ^ (s2_n_717 & s2_sbox_in[4]); 

//  NR2D1 g10881__5122(.A1 (n_713), .A2 (n_133), .ZN (n_728));  
assign s1_n_728 = ~(s2_n_713 | s1_n_133) ^ (s2_n_713 & s2_n_133); 
assign s2_n_728 = (s1_n_713 & s1_n_133) ^ (s1_n_713 | s2_n_133); 

//  NR2D1 g10882__8246(.A1 (n_712), .A2 (n_677), .ZN (n_727));  
assign s1_n_727 = ~(s2_n_712 | s1_n_677) ^ (s2_n_712 & s2_n_677); 
assign s2_n_727 = (s1_n_712 & s1_n_677) ^ (s1_n_712 | s2_n_677); 

//  NR2XD0 g10884__7098(.A1 (n_714), .A2 (sbox_in[4]), .ZN (n_726));  
assign s1_n_726 = ~(s2_n_714 | s1_sbox_in[4]) ^ (s2_n_714 & s2_sbox_in[4]); 
assign s2_n_726 = (s1_n_714 & s1_sbox_in[4]) ^ (s1_n_714 | s2_sbox_in[4]); 

//  NR2D1 g10898__6131(.A1 (n_702), .A2 (n_624), .ZN (n_725));  
assign s1_n_725 = ~(s2_n_702 | s1_n_624) ^ (s2_n_702 & s2_n_624); 
assign s2_n_725 = (s1_n_702 & s1_n_624) ^ (s1_n_702 | s2_n_624); 

//  NR2D1 g10896__1881(.A1 (n_705), .A2 (n_703), .ZN (n_724));  
assign s1_n_724 = ~(s2_n_705 | s1_n_703) ^ (s2_n_705 & s2_n_703); 
assign s2_n_724 = (s1_n_705 & s1_n_703) ^ (s1_n_705 | s2_n_703); 

//  NR2D1 g10888__5115(.A1 (n_706), .A2 (n_306), .ZN (n_723));  
assign s1_n_723 = ~(s2_n_706 | s1_n_306) ^ (s2_n_706 & s2_n_306); 
assign s2_n_723 = (s1_n_706 & s1_n_306) ^ (s1_n_706 | s2_n_306); 

//  ND2D1 g10875__7482(.A1 (n_710), .A2 (n_176), .ZN (n_722));  
assign s1_n_722 = ~(s1_n_710 & s1_n_176) ^ (s1_n_710 & s2_n_176); 
assign s2_n_722 = (s2_n_710 & s1_n_176) ^ (s2_n_710 & s2_n_176); 

//  NR2XD0 g10878__4733(.A1 (n_707), .A2 (sbox_in[4]), .ZN (n_721));  
assign s1_n_721 = ~(s2_n_707 | s1_sbox_in[4]) ^ (s2_n_707 & s2_sbox_in[4]); 
assign s2_n_721 = (s1_n_707 & s1_sbox_in[4]) ^ (s1_n_707 | s2_sbox_in[4]); 

//  NR2D1 g10877__6161(.A1 (n_708), .A2 (n_640), .ZN (n_720));  
assign s1_n_720 = ~(s2_n_708 | s1_n_640) ^ (s2_n_708 & s2_n_640); 
assign s2_n_720 = (s1_n_708 & s1_n_640) ^ (s1_n_708 | s2_n_640); 

//  NR2XD0 g10876__9315(.A1 (n_701), .A2 (n_716), .ZN (n_719));  
assign s1_n_719 = ~(s2_n_701 | s1_n_716) ^ (s2_n_701 & s2_n_716); 
assign s2_n_719 = (s1_n_701 & s1_n_716) ^ (s1_n_701 | s2_n_716); 

//  NR2XD0 g10883__9945(.A1 (n_711), .A2 (n_753), .ZN (n_718));  
assign s1_n_718 = ~(s2_n_711 | s1_n_753) ^ (s2_n_711 & s2_n_753); 
assign s2_n_718 = (s1_n_711 & s1_n_753) ^ (s1_n_711 | s2_n_753); 

//  NR2XD0 g10889__2883(.A1 (n_700), .A2 (n_716), .ZN (n_717));  
assign s1_n_717 = ~(s2_n_700 | s1_n_716) ^ (s2_n_700 & s2_n_716); 
assign s2_n_717 = (s1_n_700 & s1_n_716) ^ (s1_n_700 | s2_n_716); 

//  NR2XD0 g10892__2346(.A1 (n_698), .A2 (sbox_in[6]), .ZN (n_715));  
assign s1_n_715 = ~(s2_n_698 | s1_sbox_in[6]) ^ (s2_n_698 & s2_sbox_in[6]); 
assign s2_n_715 = (s1_n_698 & s1_sbox_in[6]) ^ (s1_n_698 | s2_sbox_in[6]); 

//  NR2D1 g10893__1666(.A1 (n_693), .A2 (n_689), .ZN (n_714));  
assign s1_n_714 = ~(s2_n_693 | s1_n_689) ^ (s2_n_693 & s2_n_689); 
assign s2_n_714 = (s1_n_693 & s1_n_689) ^ (s1_n_693 | s2_n_689); 

//  ND2D1 g10894__7410(.A1 (n_699), .A2 (n_626), .ZN (n_713));  
assign s1_n_713 = ~(s1_n_699 & s1_n_626) ^ (s1_n_699 & s2_n_626); 
assign s2_n_713 = (s2_n_699 & s1_n_626) ^ (s2_n_699 & s2_n_626); 

//  ND2D1 g10895__6417(.A1 (n_681), .A2 (n_695), .ZN (n_712));  
assign s1_n_712 = ~(s1_n_681 & s1_n_695) ^ (s1_n_681 & s2_n_695); 
assign s2_n_712 = (s2_n_681 & s1_n_695) ^ (s2_n_681 & s2_n_695); 

//  ND2D1 g10891__5477(.A1 (n_692), .A2 (n_716), .ZN (n_711));  
assign s1_n_711 = ~(s1_n_692 & s1_n_716) ^ (s1_n_692 & s2_n_716); 
assign s2_n_711 = (s2_n_692 & s1_n_716) ^ (s2_n_692 & s2_n_716); 

//  NR2XD0 g10890__2398(.A1 (n_678), .A2 (n_330), .ZN (n_710));  
assign s1_n_710 = ~(s2_n_678 | s1_n_330) ^ (s2_n_678 & s2_n_330); 
assign s2_n_710 = (s1_n_678 & s1_n_330) ^ (s1_n_678 | s2_n_330); 

//  ND2D1 g10887__5107(.A1 (n_684), .A2 (n_667), .ZN (n_709));  
assign s1_n_709 = ~(s1_n_684 & s1_n_667) ^ (s1_n_684 & s2_n_667); 
assign s2_n_709 = (s2_n_684 & s1_n_667) ^ (s2_n_684 & s2_n_667); 

//  NR2XD0 g10897__6260(.A1 (n_679), .A2 (n_596), .ZN (n_708));  
assign s1_n_708 = ~(s2_n_679 | s1_n_596) ^ (s2_n_679 & s2_n_596); 
assign s2_n_708 = (s1_n_679 & s1_n_596) ^ (s1_n_679 | s2_n_596); 

//  NR2D1 g10899__4319(.A1 (n_683), .A2 (n_672), .ZN (n_707));  
assign s1_n_707 = ~(s2_n_683 | s1_n_672) ^ (s2_n_683 & s2_n_672); 
assign s2_n_707 = (s1_n_683 & s1_n_672) ^ (s1_n_683 | s2_n_672); 

//  OR2D1 g10900__8428(.A1 (n_686), .A2 (n_670), .Z (n_706));  
assign s1_n_706 = (s2_n_686 | s1_n_670) ^ (s2_n_686 & s2_n_670); 
assign s2_n_706 = (s1_n_686 & s1_n_670) ^ (s1_n_686 | s2_n_670); 

//  ND2D1 g10909__5526(.A1 (n_685), .A2 (n_156), .ZN (n_705));  
assign s1_n_705 = ~(s1_n_685 & s1_n_156) ^ (s1_n_685 & s2_n_156); 
assign s2_n_705 = (s2_n_685 & s1_n_156) ^ (s2_n_685 & s2_n_156); 

//  NR2XD0 g10912__6783(.A1 (n_688), .A2 (n_581), .ZN (n_704));  
assign s1_n_704 = ~(s2_n_688 | s1_n_581) ^ (s2_n_688 & s2_n_581); 
assign s2_n_704 = (s1_n_688 & s1_n_581) ^ (s1_n_688 | s2_n_581); 

//  ND2D1 g10915__3680(.A1 (n_620), .A2 (n_691), .ZN (n_703));  
assign s1_n_703 = ~(s1_n_620 & s1_n_691) ^ (s1_n_620 & s2_n_691); 
assign s2_n_703 = (s2_n_620 & s1_n_691) ^ (s2_n_620 & s2_n_691); 

//  NR2D1 g10916__1617(.A1 (n_690), .A2 (n_696), .ZN (n_702));  
assign s1_n_702 = ~(s2_n_690 | s1_n_696) ^ (s2_n_690 & s2_n_696); 
assign s2_n_702 = (s1_n_690 & s1_n_696) ^ (s1_n_690 | s2_n_696); 

//  NR2D1 g10886__2802(.A1 (n_682), .A2 (n_479), .ZN (n_701));  
assign s1_n_701 = ~(s2_n_682 | s1_n_479) ^ (s2_n_682 & s2_n_479); 
assign s2_n_701 = (s1_n_682 & s1_n_479) ^ (s1_n_682 | s2_n_479); 

//  NR2D1 g10902__1705(.A1 (n_666), .A2 (n_533), .ZN (n_700));  
assign s1_n_700 = ~(s2_n_666 | s1_n_533) ^ (s2_n_666 & s2_n_533); 
assign s2_n_700 = (s1_n_666 & s1_n_533) ^ (s1_n_666 | s2_n_533); 

//  ND2D1 g10903__5122(.A1 (n_665), .A2 (n_716), .ZN (n_699));  
assign s1_n_699 = ~(s1_n_665 & s1_n_716) ^ (s1_n_665 & s2_n_716); 
assign s2_n_699 = (s2_n_665 & s1_n_716) ^ (s2_n_665 & s2_n_716); 

//  NR2D1 g10906__8246(.A1 (n_591), .A2 (n_669), .ZN (n_698));  
assign s1_n_698 = ~(s2_n_591 | s1_n_669) ^ (s2_n_591 & s2_n_669); 
assign s2_n_698 = (s1_n_591 & s1_n_669) ^ (s1_n_591 | s2_n_669); 

//  NR2D1 g10914__7098(.A1 (n_673), .A2 (n_696), .ZN (n_697));  
assign s1_n_697 = ~(s2_n_673 | s1_n_696) ^ (s2_n_673 & s2_n_696); 
assign s2_n_697 = (s1_n_673 & s1_n_696) ^ (s1_n_673 | s2_n_696); 

//  ND2D1 g10913__6131(.A1 (n_674), .A2 (n_44), .ZN (n_695));  
assign s1_n_695 = ~(s1_n_674 & s1_n_44) ^ (s1_n_674 & s2_n_44); 
assign s2_n_695 = (s2_n_674 & s1_n_44) ^ (s2_n_674 & s2_n_44); 

//  ND2D1 g10911__1881(.A1 (n_675), .A2 (n_588), .ZN (n_694));  
assign s1_n_694 = ~(s1_n_675 & s1_n_588) ^ (s1_n_675 & s2_n_588); 
assign s2_n_694 = (s2_n_675 & s1_n_588) ^ (s2_n_675 & s2_n_588); 

//  ND2D1 g10919__5115(.A1 (n_668), .A2 (n_613), .ZN (n_693));  
assign s1_n_693 = ~(s1_n_668 & s1_n_613) ^ (s1_n_668 & s2_n_613); 
assign s2_n_693 = (s2_n_668 & s1_n_613) ^ (s2_n_668 & s2_n_613); 

//  ND2D1 g10904__7482(.A1 (n_645), .A2 (n_592), .ZN (n_692));  
assign s1_n_692 = ~(s1_n_645 & s1_n_592) ^ (s1_n_645 & s2_n_592); 
assign s2_n_692 = (s2_n_645 & s1_n_592) ^ (s2_n_645 & s2_n_592); 

//  ND2D1 g10930__4733(.A1 (n_647), .A2 (n_651), .ZN (n_691));  
assign s1_n_691 = ~(s1_n_647 & s1_n_651) ^ (s1_n_647 & s2_n_651); 
assign s2_n_691 = (s2_n_647 & s1_n_651) ^ (s2_n_647 & s2_n_651); 

//  NR2XD0 g10943__6161(.A1 (n_648), .A2 (n_653), .ZN (n_690));  
assign s1_n_690 = ~(s2_n_648 | s1_n_653) ^ (s2_n_648 & s2_n_653); 
assign s2_n_690 = (s1_n_648 & s1_n_653) ^ (s1_n_648 | s2_n_653); 

//  ND2D1 g10945__9315(.A1 (n_649), .A2 (n_404), .ZN (n_689));  
assign s1_n_689 = ~(s1_n_649 & s1_n_404) ^ (s1_n_649 & s2_n_404); 
assign s2_n_689 = (s2_n_649 & s1_n_404) ^ (s2_n_649 & s2_n_404); 

//  NR2D1 g10948__9945(.A1 (n_646), .A2 (n_671), .ZN (n_688));  
assign s1_n_688 = ~(s2_n_646 | s1_n_671) ^ (s2_n_646 & s2_n_671); 
assign s2_n_688 = (s1_n_646 & s1_n_671) ^ (s1_n_646 | s2_n_671); 

//  NR2D1 g10901__2883(.A1 (n_660), .A2 (n_587), .ZN (n_687));  
assign s1_n_687 = ~(s2_n_660 | s1_n_587) ^ (s2_n_660 & s2_n_587); 
assign s2_n_687 = (s1_n_660 & s1_n_587) ^ (s1_n_660 | s2_n_587); 

//  ND2D1 g10928__2346(.A1 (n_638), .A2 (n_652), .ZN (n_686));  
assign s1_n_686 = ~(s1_n_638 & s1_n_652) ^ (s1_n_638 & s2_n_652); 
assign s2_n_686 = (s2_n_638 & s1_n_652) ^ (s2_n_638 & s2_n_652); 

//  ND2D1 g10927__1666(.A1 (n_654), .A2 (n_680), .ZN (n_685));  
assign s1_n_685 = ~(s1_n_654 & s1_n_680) ^ (s1_n_654 & s2_n_680); 
assign s2_n_685 = (s2_n_654 & s1_n_680) ^ (s2_n_654 & s2_n_680); 

//  NR2D1 g10907__7410(.A1 (n_661), .A2 (n_637), .ZN (n_684));  
assign s1_n_684 = ~(s2_n_661 | s1_n_637) ^ (s2_n_661 & s2_n_637); 
assign s2_n_684 = (s1_n_661 & s1_n_637) ^ (s1_n_661 | s2_n_637); 

//  ND2D1 g10908__6417(.A1 (n_658), .A2 (n_546), .ZN (n_683));  
assign s1_n_683 = ~(s1_n_658 & s1_n_546) ^ (s1_n_658 & s2_n_546); 
assign s2_n_683 = (s2_n_658 & s1_n_546) ^ (s2_n_658 & s2_n_546); 

//  ND2D1 g10910__5477(.A1 (n_657), .A2 (n_164), .ZN (n_682));  
assign s1_n_682 = ~(s1_n_657 & s1_n_164) ^ (s1_n_657 & s2_n_164); 
assign s2_n_682 = (s2_n_657 & s1_n_164) ^ (s2_n_657 & s2_n_164); 

//  ND2D1 g10917__2398(.A1 (n_655), .A2 (n_680), .ZN (n_681));  
assign s1_n_681 = ~(s1_n_655 & s1_n_680) ^ (s1_n_655 & s2_n_680); 
assign s2_n_681 = (s2_n_655 & s1_n_680) ^ (s2_n_655 & s2_n_680); 

//  NR2D1 g10918__5107(.A1 (n_659), .A2 (n_635), .ZN (n_679));  
assign s1_n_679 = ~(s2_n_659 | s1_n_635) ^ (s2_n_659 & s2_n_635); 
assign s2_n_679 = (s1_n_659 & s1_n_635) ^ (s1_n_659 | s2_n_635); 

//  ND2D1 g10905__6260(.A1 (n_656), .A2 (n_90), .ZN (n_678));  
assign s1_n_678 = ~(s1_n_656 & s1_n_90) ^ (s1_n_656 & s2_n_90); 
assign s2_n_678 = (s2_n_656 & s1_n_90) ^ (s2_n_656 & s2_n_90); 

//  NR2XD0 g10940__4319(.A1 (n_630), .A2 (n_639), .ZN (n_677));  
assign s1_n_677 = ~(s2_n_630 | s1_n_639) ^ (s2_n_630 & s2_n_639); 
assign s2_n_677 = (s1_n_630 & s1_n_639) ^ (s1_n_630 | s2_n_639); 

//  NR2XD0 g10932__8428(.A1 (n_618), .A2 (n_621), .ZN (n_676));  
assign s1_n_676 = ~(s2_n_618 | s1_n_621) ^ (s2_n_618 & s2_n_621); 
assign s2_n_676 = (s1_n_618 & s1_n_621) ^ (s1_n_618 | s2_n_621); 

//  NR2XD0 g10936__5526(.A1 (n_622), .A2 (n_615), .ZN (n_675));  
assign s1_n_675 = ~(s2_n_622 | s1_n_615) ^ (s2_n_622 & s2_n_615); 
assign s2_n_675 = (s1_n_622 & s1_n_615) ^ (s1_n_622 | s2_n_615); 

//  ND2D1 g10937__6783(.A1 (n_631), .A2 (n_558), .ZN (n_674));  
assign s1_n_674 = ~(s1_n_631 & s1_n_558) ^ (s1_n_631 & s2_n_558); 
assign s2_n_674 = (s2_n_631 & s1_n_558) ^ (s2_n_631 & s2_n_558); 

//  NR2XD0 g10938__3680(.A1 (n_625), .A2 (n_359), .ZN (n_673));  
assign s1_n_673 = ~(s2_n_625 | s1_n_359) ^ (s2_n_625 & s2_n_359); 
assign s2_n_673 = (s1_n_625 & s1_n_359) ^ (s1_n_625 | s2_n_359); 

//  NR2XD0 g10939__1617(.A1 (n_629), .A2 (n_671), .ZN (n_672));  
assign s1_n_672 = ~(s2_n_629 | s1_n_671) ^ (s2_n_629 & s2_n_671); 
assign s2_n_672 = (s1_n_629 & s1_n_671) ^ (s1_n_629 | s2_n_671); 

//  ND2D1 g10929__2802(.A1 (n_628), .A2 (n_318), .ZN (n_670));  
assign s1_n_670 = ~(s1_n_628 & s1_n_318) ^ (s1_n_628 & s2_n_318); 
assign s2_n_670 = (s2_n_628 & s1_n_318) ^ (s2_n_628 & s2_n_318); 

//  NR2XD0 g10924__1705(.A1 (n_636), .A2 (sbox_in[2]), .ZN (n_669));  
assign s1_n_669 = ~(s2_n_636 | s1_sbox_in[2]) ^ (s2_n_636 & s2_sbox_in[2]); 
assign s2_n_669 = (s1_n_636 & s1_sbox_in[2]) ^ (s1_n_636 | s2_sbox_in[2]); 

//  NR2D1 g10947__5122(.A1 (n_619), .A2 (n_285), .ZN (n_668));  
assign s1_n_668 = ~(s2_n_619 | s1_n_285) ^ (s2_n_619 & s2_n_285); 
assign s2_n_668 = (s1_n_619 & s1_n_285) ^ (s1_n_619 | s2_n_285); 

//  ND2D1 g10920__8246(.A1 (n_623), .A2 (n_663), .ZN (n_667));  
assign s1_n_667 = ~(s1_n_623 & s1_n_663) ^ (s1_n_623 & s2_n_663); 
assign s2_n_667 = (s2_n_623 & s1_n_663) ^ (s2_n_623 & s2_n_663); 

//  ND2D1 g10921__7098(.A1 (n_634), .A2 (n_349), .ZN (n_666));  
assign s1_n_666 = ~(s1_n_634 & s1_n_349) ^ (s1_n_634 & s2_n_349); 
assign s2_n_666 = (s2_n_634 & s1_n_349) ^ (s2_n_634 & s2_n_349); 

//  ND2D1 g10922__6131(.A1 (n_602), .A2 (n_643), .ZN (n_665));  
assign s1_n_665 = ~(s1_n_602 & s1_n_643) ^ (s1_n_602 & s2_n_643); 
assign s2_n_665 = (s2_n_602 & s1_n_643) ^ (s2_n_602 & s2_n_643); 

//  ND2D1 g10923__1881(.A1 (n_642), .A2 (n_663), .ZN (n_664));  
assign s1_n_664 = ~(s1_n_642 & s1_n_663) ^ (s1_n_642 & s2_n_663); 
assign s2_n_664 = (s2_n_642 & s1_n_663) ^ (s2_n_642 & s2_n_663); 

//  ND2D1 g10944__5115(.A1 (n_617), .A2 (n_627), .ZN (n_662));  
assign s1_n_662 = ~(s1_n_617 & s1_n_627) ^ (s1_n_617 & s2_n_627); 
assign s2_n_662 = (s2_n_617 & s1_n_627) ^ (s2_n_617 & s2_n_627); 

//  ND2D1 g10941__7482(.A1 (n_598), .A2 (n_607), .ZN (n_661));  
assign s1_n_661 = ~(s1_n_598 & s1_n_607) ^ (s1_n_598 & s2_n_607); 
assign s2_n_661 = (s2_n_598 & s1_n_607) ^ (s2_n_598 & s2_n_607); 

//  AN2XD1 g10933__4733(.A1 (n_601), .A2 (n_563), .Z (n_660));  
assign s1_n_660 = (s1_n_601 & s1_n_563) ^ (s1_n_601 & s2_n_563); 
assign s2_n_660 = (s2_n_601 & s1_n_563) ^ (s2_n_601 & s2_n_563); 

//  ND2D1 g10934__6161(.A1 (n_589), .A2 (n_641), .ZN (n_659));  
assign s1_n_659 = ~(s1_n_589 & s1_n_641) ^ (s1_n_589 & s2_n_641); 
assign s2_n_659 = (s2_n_589 & s1_n_641) ^ (s2_n_589 & s2_n_641); 

//  NR2D1 g10935__9315(.A1 (n_604), .A2 (n_593), .ZN (n_658));  
assign s1_n_658 = ~(s2_n_604 | s1_n_593) ^ (s2_n_604 & s2_n_593); 
assign s2_n_658 = (s1_n_604 & s1_n_593) ^ (s1_n_604 | s2_n_593); 

//  ND2D1 g10931__9945(.A1 (n_586), .A2 (sbox_in[2]), .ZN (n_657));  
assign s1_n_657 = ~(s1_n_586 & s1_sbox_in[2]) ^ (s1_n_586 & s2_sbox_in[2]); 
assign s2_n_657 = (s2_n_586 & s1_sbox_in[2]) ^ (s2_n_586 & s2_sbox_in[2]); 

//  ND2D1 g10942__2883(.A1 (n_584), .A2 (sbox_in[2]), .ZN (n_656));  
assign s1_n_656 = ~(s1_n_584 & s1_sbox_in[2]) ^ (s1_n_584 & s2_sbox_in[2]); 
assign s2_n_656 = (s2_n_584 & s1_sbox_in[2]) ^ (s2_n_584 & s2_sbox_in[2]); 

//  ND2D1 g10946__2346(.A1 (n_585), .A2 (n_565), .ZN (n_655));  
assign s1_n_655 = ~(s1_n_585 & s1_n_565) ^ (s1_n_585 & s2_n_565); 
assign s2_n_655 = (s2_n_585 & s1_n_565) ^ (s2_n_585 & s2_n_565); 

//  OR2D1 g10953__1666(.A1 (n_583), .A2 (n_653), .Z (n_654));  
assign s1_n_654 = (s2_n_583 | s1_n_653) ^ (s2_n_583 & s2_n_653); 
assign s2_n_654 = (s1_n_583 & s1_n_653) ^ (s1_n_583 | s2_n_653); 

//  ND2D1 g10988__7410(.A1 (n_605), .A2 (n_651), .ZN (n_652));  
assign s1_n_652 = ~(s1_n_605 & s1_n_651) ^ (s1_n_605 & s2_n_651); 
assign s2_n_652 = (s2_n_605 & s1_n_651) ^ (s2_n_605 & s2_n_651); 

//  ND2D1 g10962__6417(.A1 (n_610), .A2 (n_611), .ZN (n_650));  
assign s1_n_650 = ~(s1_n_610 & s1_n_611) ^ (s1_n_610 & s2_n_611); 
assign s2_n_650 = (s2_n_610 & s1_n_611) ^ (s2_n_610 & s2_n_611); 

//  NR2D1 g10963__5477(.A1 (n_597), .A2 (n_312), .ZN (n_649));  
assign s1_n_649 = ~(s2_n_597 | s1_n_312) ^ (s2_n_597 & s2_n_312); 
assign s2_n_649 = (s1_n_597 & s1_n_312) ^ (s1_n_597 | s2_n_312); 

//  ND2D1 g10983__2398(.A1 (n_609), .A2 (n_474), .ZN (n_648));  
assign s1_n_648 = ~(s1_n_609 & s1_n_474) ^ (s1_n_609 & s2_n_474); 
assign s2_n_648 = (s2_n_609 & s1_n_474) ^ (s2_n_609 & s2_n_474); 

//  ND2D1 g10961__5107(.A1 (n_582), .A2 (n_371), .ZN (n_647));  
assign s1_n_647 = ~(s1_n_582 & s1_n_371) ^ (s1_n_582 & s2_n_371); 
assign s2_n_647 = (s2_n_582 & s1_n_371) ^ (s2_n_582 & s2_n_371); 

//  NR2XD0 g10992__6260(.A1 (n_608), .A2 (n_95), .ZN (n_646));  
assign s1_n_646 = ~(s2_n_608 | s1_n_95) ^ (s2_n_608 & s2_n_95); 
assign s2_n_646 = (s1_n_608 & s1_n_95) ^ (s1_n_608 | s2_n_95); 

//  ND2D1 g10925__4319(.A1 (n_600), .A2 (sbox_in[2]), .ZN (n_645));  
assign s1_n_645 = ~(s1_n_600 & s1_sbox_in[2]) ^ (s1_n_600 & s2_sbox_in[2]); 
assign s2_n_645 = (s2_n_600 & s1_sbox_in[2]) ^ (s2_n_600 & s2_sbox_in[2]); 

//  ND2D1 g10926__8428(.A1 (n_603), .A2 (n_651), .ZN (n_644));  
assign s1_n_644 = ~(s1_n_603 & s1_n_651) ^ (s1_n_603 & s2_n_651); 
assign s2_n_644 = (s2_n_603 & s1_n_651) ^ (s2_n_603 & s2_n_651); 

//  ND2D1 g10960__5526(.A1 (n_574), .A2 (sbox_in[2]), .ZN (n_643));  
assign s1_n_643 = ~(s1_n_574 & s1_sbox_in[2]) ^ (s1_n_574 & s2_sbox_in[2]); 
assign s2_n_643 = (s2_n_574 & s1_sbox_in[2]) ^ (s2_n_574 & s2_sbox_in[2]); 

//  ND2D1 g10950__6783(.A1 (n_552), .A2 (n_641), .ZN (n_642));  
assign s1_n_642 = ~(s1_n_552 & s1_n_641) ^ (s1_n_552 & s2_n_641); 
assign s2_n_642 = (s2_n_552 & s1_n_641) ^ (s2_n_552 & s2_n_641); 

//  NR2XD0 g10954__3680(.A1 (n_547), .A2 (n_639), .ZN (n_640));  
assign s1_n_640 = ~(s2_n_547 | s1_n_639) ^ (s2_n_547 & s2_n_639); 
assign s2_n_640 = (s1_n_547 & s1_n_639) ^ (s1_n_547 | s2_n_639); 

//  NR2D1 g10956__1617(.A1 (n_554), .A2 (n_160), .ZN (n_638));  
assign s1_n_638 = ~(s2_n_554 | s1_n_160) ^ (s2_n_554 & s2_n_160); 
assign s2_n_638 = (s1_n_554 & s1_n_160) ^ (s1_n_554 | s2_n_160); 

//  NR2XD0 g10957__2802(.A1 (n_548), .A2 (n_39), .ZN (n_637));  
assign s1_n_637 = ~(s2_n_548 | s1_n_39) ^ (s2_n_548 & s2_n_39); 
assign s2_n_637 = (s1_n_548 & s1_n_39) ^ (s1_n_548 | s2_n_39); 

//  NR2D1 g10958__1705(.A1 (n_549), .A2 (n_635), .ZN (n_636));  
assign s1_n_636 = ~(s2_n_549 | s1_n_635) ^ (s2_n_549 & s2_n_635); 
assign s2_n_636 = (s1_n_549 & s1_n_635) ^ (s1_n_549 | s2_n_635); 

//  ND2D1 g10949__5122(.A1 (n_550), .A2 (sbox_in[2]), .ZN (n_634));  
assign s1_n_634 = ~(s1_n_550 & s1_sbox_in[2]) ^ (s1_n_550 & s2_sbox_in[2]); 
assign s2_n_634 = (s2_n_550 & s1_sbox_in[2]) ^ (s2_n_550 & s2_sbox_in[2]); 

//  ND2D1 g10965__8246(.A1 (n_553), .A2 (n_544), .ZN (n_633));  
assign s1_n_633 = ~(s1_n_553 & s1_n_544) ^ (s1_n_553 & s2_n_544); 
assign s2_n_633 = (s2_n_553 & s1_n_544) ^ (s2_n_553 & s2_n_544); 

//  NR2XD0 g10966__7098(.A1 (n_570), .A2 (n_18), .ZN (n_632));  
assign s1_n_632 = ~(s2_n_570 | s1_n_18) ^ (s2_n_570 & s2_n_18); 
assign s2_n_632 = (s1_n_570 & s1_n_18) ^ (s1_n_570 | s2_n_18); 

//  NR2D1 g10972__6131(.A1 (n_562), .A2 (n_635), .ZN (n_631));  
assign s1_n_631 = ~(s2_n_562 | s1_n_635) ^ (s2_n_562 & s2_n_635); 
assign s2_n_631 = (s1_n_562 & s1_n_635) ^ (s1_n_562 | s2_n_635); 

//  NR2D1 g10973__1881(.A1 (n_568), .A2 (n_569), .ZN (n_630));  
assign s1_n_630 = ~(s2_n_568 | s1_n_569) ^ (s2_n_568 & s2_n_569); 
assign s2_n_630 = (s1_n_568 & s1_n_569) ^ (s1_n_568 | s2_n_569); 

//  NR2D1 g10974__5115(.A1 (n_573), .A2 (n_635), .ZN (n_629));  
assign s1_n_629 = ~(s2_n_573 | s1_n_635) ^ (s2_n_573 & s2_n_635); 
assign s2_n_629 = (s1_n_573 & s1_n_635) ^ (s1_n_573 | s2_n_635); 

//  ND2D1 g10975__7482(.A1 (n_557), .A2 (n_627), .ZN (n_628));  
assign s1_n_628 = ~(s1_n_557 & s1_n_627) ^ (s1_n_557 & s2_n_627); 
assign s2_n_628 = (s2_n_557 & s1_n_627) ^ (s2_n_557 & s2_n_627); 

//  ND2D1 g10977__4733(.A1 (n_566), .A2 (n_651), .ZN (n_626));  
assign s1_n_626 = ~(s1_n_566 & s1_n_651) ^ (s1_n_566 & s2_n_651); 
assign s2_n_626 = (s2_n_566 & s1_n_651) ^ (s2_n_566 & s2_n_651); 

//  OR2D1 g10979__6161(.A1 (n_571), .A2 (n_653), .Z (n_625));  
assign s1_n_625 = (s2_n_571 | s1_n_653) ^ (s2_n_571 & s2_n_653); 
assign s2_n_625 = (s1_n_571 & s1_n_653) ^ (s1_n_571 | s2_n_653); 

//  NR2XD0 g10980__9315(.A1 (n_561), .A2 (n_614), .ZN (n_624));  
assign s1_n_624 = ~(s2_n_561 | s1_n_614) ^ (s2_n_561 & s2_n_614); 
assign s2_n_624 = (s1_n_561 & s1_n_614) ^ (s1_n_561 | s2_n_614); 

//  ND2D1 g10984__9945(.A1 (n_577), .A2 (n_264), .ZN (n_623));  
assign s1_n_623 = ~(s1_n_577 & s1_n_264) ^ (s1_n_577 & s2_n_264); 
assign s2_n_623 = (s2_n_577 & s1_n_264) ^ (s2_n_577 & s2_n_264); 

//  NR2XD0 g10985__2883(.A1 (n_560), .A2 (n_621), .ZN (n_622));  
assign s1_n_622 = ~(s2_n_560 | s1_n_621) ^ (s2_n_560 & s2_n_621); 
assign s2_n_622 = (s1_n_560 & s1_n_621) ^ (s1_n_560 | s2_n_621); 

//  ND2D1 g10986__2346(.A1 (n_576), .A2 (n_627), .ZN (n_620));  
assign s1_n_620 = ~(s1_n_576 & s1_n_627) ^ (s1_n_576 & s2_n_627); 
assign s2_n_620 = (s2_n_576 & s1_n_627) ^ (s2_n_576 & s2_n_627); 

//  NR2D1 g10989__1666(.A1 (n_580), .A2 (n_639), .ZN (n_619));  
assign s1_n_619 = ~(s2_n_580 | s1_n_639) ^ (s2_n_580 & s2_n_639); 
assign s2_n_619 = (s1_n_580 & s1_n_639) ^ (s1_n_580 | s2_n_639); 

//  NR2D1 g10990__7410(.A1 (n_567), .A2 (n_507), .ZN (n_618));  
assign s1_n_618 = ~(s2_n_567 | s1_n_507) ^ (s2_n_567 & s2_n_507); 
assign s2_n_618 = (s1_n_567 & s1_n_507) ^ (s1_n_567 | s2_n_507); 

//  ND2D1 g10991__6417(.A1 (n_578), .A2 (n_442), .ZN (n_617));  
assign s1_n_617 = ~(s1_n_578 & s1_n_442) ^ (s1_n_578 & s2_n_442); 
assign s2_n_617 = (s2_n_578 & s1_n_442) ^ (s2_n_578 & s2_n_442); 

//  ND2D1 g10994__5477(.A1 (n_559), .A2 (n_606), .ZN (n_616));  
assign s1_n_616 = ~(s1_n_559 & s1_n_606) ^ (s1_n_559 & s2_n_606); 
assign s2_n_616 = (s2_n_559 & s1_n_606) ^ (s2_n_559 & s2_n_606); 

//  NR2D1 g10996__2398(.A1 (n_555), .A2 (n_614), .ZN (n_615));  
assign s1_n_615 = ~(s2_n_555 | s1_n_614) ^ (s2_n_555 & s2_n_614); 
assign s2_n_615 = (s1_n_555 & s1_n_614) ^ (s1_n_555 | s2_n_614); 

//  ND2D1 g10997__5107(.A1 (n_556), .A2 (n_680), .ZN (n_613));  
assign s1_n_613 = ~(s1_n_556 & s1_n_680) ^ (s1_n_556 & s2_n_680); 
assign s2_n_613 = (s2_n_556 & s1_n_680) ^ (s2_n_556 & s2_n_680); 

//  ND2D1 g11030__6260(.A1 (n_525), .A2 (n_611), .ZN (n_612));  
assign s1_n_612 = ~(s1_n_525 & s1_n_611) ^ (s1_n_525 & s2_n_611); 
assign s2_n_612 = (s2_n_525 & s1_n_611) ^ (s2_n_525 & s2_n_611); 

//  ND2D1 g11031__4319(.A1 (n_523), .A2 (n_575), .ZN (n_610));  
assign s1_n_610 = ~(s1_n_523 & s1_n_575) ^ (s1_n_523 & s2_n_575); 
assign s2_n_610 = (s2_n_523 & s1_n_575) ^ (s2_n_523 & s2_n_575); 

//  NR2XD0 g11035__8428(.A1 (n_521), .A2 (n_356), .ZN (n_609));  
assign s1_n_609 = ~(s2_n_521 | s1_n_356) ^ (s2_n_521 & s2_n_356); 
assign s2_n_609 = (s1_n_521 & s1_n_356) ^ (s1_n_521 | s2_n_356); 

//  ND2D1 g11047__5526(.A1 (n_520), .A2 (n_72), .ZN (n_608));  
assign s1_n_608 = ~(s1_n_520 & s1_n_72) ^ (s1_n_520 & s2_n_72); 
assign s2_n_608 = (s2_n_520 & s1_n_72) ^ (s2_n_520 & s2_n_72); 

//  ND2D1 g11049__6783(.A1 (n_524), .A2 (n_606), .ZN (n_607));  
assign s1_n_607 = ~(s1_n_524 & s1_n_606) ^ (s1_n_524 & s2_n_606); 
assign s2_n_607 = (s2_n_524 & s1_n_606) ^ (s2_n_524 & s2_n_606); 

//  ND2D1 g11051__3680(.A1 (n_519), .A2 (n_392), .ZN (n_605));  
assign s1_n_605 = ~(s1_n_519 & s1_n_392) ^ (s1_n_519 & s2_n_392); 
assign s2_n_605 = (s2_n_519 & s1_n_392) ^ (s2_n_519 & s2_n_392); 

//  NR2D1 g11053__1617(.A1 (n_529), .A2 (n_594), .ZN (n_604));  
assign s1_n_604 = ~(s2_n_529 | s1_n_594) ^ (s2_n_529 & s2_n_594); 
assign s2_n_604 = (s1_n_529 & s1_n_594) ^ (s1_n_529 | s2_n_594); 

//  ND2D1 g10951__2802(.A1 (n_517), .A2 (n_487), .ZN (n_603));  
assign s1_n_603 = ~(s1_n_517 & s1_n_487) ^ (s1_n_517 & s2_n_487); 
assign s2_n_603 = (s2_n_517 & s1_n_487) ^ (s2_n_517 & s2_n_487); 

//  NR2D1 g10952__1705(.A1 (n_539), .A2 (n_504), .ZN (n_602));  
assign s1_n_602 = ~(s2_n_539 | s1_n_504) ^ (s2_n_539 & s2_n_504); 
assign s2_n_602 = (s1_n_539 & s1_n_504) ^ (s1_n_539 | s2_n_504); 

//  ND2D1 g10955__5122(.A1 (n_518), .A2 (n_492), .ZN (n_601));  
assign s1_n_601 = ~(s1_n_518 & s1_n_492) ^ (s1_n_518 & s2_n_492); 
assign s2_n_601 = (s2_n_518 & s1_n_492) ^ (s2_n_518 & s2_n_492); 

//  ND2D1 g10959__8246(.A1 (n_516), .A2 (n_455), .ZN (n_600));  
assign s1_n_600 = ~(s1_n_516 & s1_n_455) ^ (s1_n_516 & s2_n_455); 
assign s2_n_600 = (s2_n_516 & s1_n_455) ^ (s2_n_516 & s2_n_455); 

//  AN2XD1 g10964__7098(.A1 (n_538), .A2 (n_663), .Z (n_599));  
assign s1_n_599 = (s1_n_538 & s1_n_663) ^ (s1_n_538 & s2_n_663); 
assign s2_n_599 = (s2_n_538 & s1_n_663) ^ (s2_n_538 & s2_n_663); 

//  ND2D1 g10967__6131(.A1 (n_534), .A2 (n_611), .ZN (n_598));  
assign s1_n_598 = ~(s1_n_534 & s1_n_611) ^ (s1_n_534 & s2_n_611); 
assign s2_n_598 = (s2_n_534 & s1_n_611) ^ (s2_n_534 & s2_n_611); 

//  NR2D1 g11009__1881(.A1 (n_526), .A2 (n_596), .ZN (n_597));  
assign s1_n_597 = ~(s2_n_526 | s1_n_596) ^ (s2_n_526 & s2_n_596); 
assign s2_n_597 = (s1_n_526 & s1_n_596) ^ (s1_n_526 | s2_n_596); 

//  NR2XD0 g10969__5115(.A1 (n_541), .A2 (n_594), .ZN (n_595));  
assign s1_n_595 = ~(s2_n_541 | s1_n_594) ^ (s2_n_541 & s2_n_594); 
assign s2_n_595 = (s1_n_541 & s1_n_594) ^ (s1_n_541 | s2_n_594); 

//  NR2D1 g10970__7482(.A1 (n_531), .A2 (n_596), .ZN (n_593));  
assign s1_n_593 = ~(s2_n_531 | s1_n_596) ^ (s2_n_531 & s2_n_596); 
assign s2_n_593 = (s1_n_531 & s1_n_596) ^ (s1_n_531 | s2_n_596); 

//  ND2D1 g10971__4733(.A1 (n_530), .A2 (n_590), .ZN (n_592));  
assign s1_n_592 = ~(s1_n_530 & s1_n_590) ^ (s1_n_530 & s2_n_590); 
assign s2_n_592 = (s2_n_530 & s1_n_590) ^ (s2_n_530 & s2_n_590); 

//  NR2XD0 g10976__6161(.A1 (n_543), .A2 (n_590), .ZN (n_591));  
assign s1_n_591 = ~(s2_n_543 | s1_n_590) ^ (s2_n_543 & s2_n_590); 
assign s2_n_591 = (s1_n_543 & s1_n_590) ^ (s1_n_543 | s2_n_590); 

//  NR2XD0 g10978__9315(.A1 (n_535), .A2 (n_572), .ZN (n_589));  
assign s1_n_589 = ~(s2_n_535 | s1_n_572) ^ (s2_n_535 & s2_n_572); 
assign s2_n_589 = (s1_n_535 & s1_n_572) ^ (s1_n_535 | s2_n_572); 

//  OR2D1 g10981__9945(.A1 (n_542), .A2 (n_696), .Z (n_588));  
assign s1_n_588 = (s2_n_542 | s1_n_696) ^ (s2_n_542 & s2_n_696); 
assign s2_n_588 = (s1_n_542 & s1_n_696) ^ (s1_n_542 | s2_n_696); 

//  NR2XD0 g10982__2883(.A1 (n_536), .A2 (n_9), .ZN (n_587));  
assign s1_n_587 = ~(s2_n_536 | s1_n_9) ^ (s2_n_536 & s2_n_9); 
assign s2_n_587 = (s1_n_536 & s1_n_9) ^ (s1_n_536 | s2_n_9); 

//  ND2D1 g10987__2346(.A1 (n_532), .A2 (n_446), .ZN (n_586));  
assign s1_n_586 = ~(s1_n_532 & s1_n_446) ^ (s1_n_532 & s2_n_446); 
assign s2_n_586 = (s2_n_532 & s1_n_446) ^ (s2_n_532 & s2_n_446); 

//  NR2D1 g10993__1666(.A1 (n_522), .A2 (n_480), .ZN (n_585));  
assign s1_n_585 = ~(s2_n_522 | s1_n_480) ^ (s2_n_522 & s2_n_480); 
assign s2_n_585 = (s1_n_522 & s1_n_480) ^ (s1_n_522 | s2_n_480); 

//  ND2D1 g10995__7410(.A1 (n_540), .A2 (n_477), .ZN (n_584));  
assign s1_n_584 = ~(s1_n_540 & s1_n_477) ^ (s1_n_540 & s2_n_477); 
assign s2_n_584 = (s2_n_540 & s1_n_477) ^ (s2_n_540 & s2_n_477); 

//  ND2D1 g10999__6417(.A1 (n_528), .A2 (n_96), .ZN (n_583));  
assign s1_n_583 = ~(s1_n_528 & s1_n_96) ^ (s1_n_528 & s2_n_96); 
assign s2_n_583 = (s2_n_528 & s1_n_96) ^ (s2_n_528 & s2_n_96); 

//  NR2XD0 g11004__5477(.A1 (n_527), .A2 (n_119), .ZN (n_582));  
assign s1_n_582 = ~(s2_n_527 | s1_n_119) ^ (s2_n_527 & s2_n_119); 
assign s2_n_582 = (s1_n_527 & s1_n_119) ^ (s1_n_527 | s2_n_119); 

//  NR2XD0 g10968__2398(.A1 (n_515), .A2 (n_594), .ZN (n_581));  
assign s1_n_581 = ~(s2_n_515 | s1_n_594) ^ (s2_n_515 & s2_n_594); 
assign s2_n_581 = (s1_n_515 & s1_n_594) ^ (s1_n_515 | s2_n_594); 

//  NR2XD0 g11037__5107(.A1 (n_478), .A2 (n_208), .ZN (n_580));  
assign s1_n_580 = ~(s2_n_478 | s1_n_208) ^ (s2_n_478 & s2_n_208); 
assign s2_n_580 = (s1_n_478 & s1_n_208) ^ (s1_n_478 | s2_n_208); 

//  OR2D1 g11017__6260(.A1 (n_491), .A2 (n_621), .Z (n_579));  
assign s1_n_579 = (s2_n_491 | s1_n_621) ^ (s2_n_491 & s2_n_621); 
assign s2_n_579 = (s1_n_491 & s1_n_621) ^ (s1_n_491 | s2_n_621); 

//  ND2D1 g11019__4319(.A1 (n_495), .A2 (sbox_in[5]), .ZN (n_578));  
assign s1_n_578 = ~(s1_n_495 & s1_sbox_in[5]) ^ (s1_n_495 & s2_sbox_in[5]); 
assign s2_n_578 = (s2_n_495 & s1_sbox_in[5]) ^ (s2_n_495 & s2_sbox_in[5]); 

//  NR2D1 g11020__8428(.A1 (n_511), .A2 (n_225), .ZN (n_577));  
assign s1_n_577 = ~(s2_n_511 | s1_n_225) ^ (s2_n_511 & s2_n_225); 
assign s2_n_577 = (s1_n_511 & s1_n_225) ^ (s1_n_511 | s2_n_225); 

//  ND2D1 g11022__5526(.A1 (n_499), .A2 (n_575), .ZN (n_576));  
assign s1_n_576 = ~(s1_n_499 & s1_n_575) ^ (s1_n_499 & s2_n_575); 
assign s2_n_576 = (s2_n_499 & s1_n_575) ^ (s2_n_499 & s2_n_575); 

//  ND2D1 g11023__6783(.A1 (n_490), .A2 (n_276), .ZN (n_574));  
assign s1_n_574 = ~(s1_n_490 & s1_n_276) ^ (s1_n_490 & s2_n_276); 
assign s2_n_574 = (s2_n_490 & s1_n_276) ^ (s2_n_490 & s2_n_276); 

//  OR2D1 g11024__3680(.A1 (n_502), .A2 (n_572), .Z (n_573));  
assign s1_n_573 = (s2_n_502 | s1_n_572) ^ (s2_n_502 & s2_n_572); 
assign s2_n_573 = (s1_n_502 & s1_n_572) ^ (s1_n_502 | s2_n_572); 

//  ND2D1 g11025__1617(.A1 (n_496), .A2 (n_482), .ZN (n_571));  
assign s1_n_571 = ~(s1_n_496 & s1_n_482) ^ (s1_n_496 & s2_n_482); 
assign s2_n_571 = (s2_n_496 & s1_n_482) ^ (s2_n_496 & s2_n_482); 

//  NR2D1 g11027__2802(.A1 (n_486), .A2 (n_569), .ZN (n_570));  
assign s1_n_570 = ~(s2_n_486 | s1_n_569) ^ (s2_n_486 & s2_n_569); 
assign s2_n_570 = (s1_n_486 & s1_n_569) ^ (s1_n_486 | s2_n_569); 

//  ND2D1 g11029__1705(.A1 (n_497), .A2 (n_23), .ZN (n_568));  
assign s1_n_568 = ~(s1_n_497 & s1_n_23) ^ (s1_n_497 & s2_n_23); 
assign s2_n_568 = (s2_n_497 & s1_n_23) ^ (s2_n_497 & s2_n_23); 

//  ND2D1 g11032__5122(.A1 (n_514), .A2 (n_58), .ZN (n_567));  
assign s1_n_567 = ~(s1_n_514 & s1_n_58) ^ (s1_n_514 & s2_n_58); 
assign s2_n_567 = (s2_n_514 & s1_n_58) ^ (s2_n_514 & s2_n_58); 

//  ND2D1 g11033__8246(.A1 (n_473), .A2 (n_565), .ZN (n_566));  
assign s1_n_566 = ~(s1_n_473 & s1_n_565) ^ (s1_n_473 & s2_n_565); 
assign s2_n_566 = (s2_n_473 & s1_n_565) ^ (s2_n_473 & s2_n_565); 

//  ND2D1 g11036__7098(.A1 (n_483), .A2 (n_563), .ZN (n_564));  
assign s1_n_564 = ~(s1_n_483 & s1_n_563) ^ (s1_n_483 & s2_n_563); 
assign s2_n_564 = (s2_n_483 & s1_n_563) ^ (s2_n_483 & s2_n_563); 

//  ND2D1 g11015__6131(.A1 (n_500), .A2 (n_105), .ZN (n_562));  
assign s1_n_562 = ~(s1_n_500 & s1_n_105) ^ (s1_n_500 & s2_n_105); 
assign s2_n_562 = (s2_n_500 & s1_n_105) ^ (s2_n_500 & s2_n_105); 

//  NR2D1 g10998__1881(.A1 (n_503), .A2 (n_422), .ZN (n_561));  
assign s1_n_561 = ~(s2_n_503 | s1_n_422) ^ (s2_n_503 & s2_n_422); 
assign s2_n_561 = (s1_n_503 & s1_n_422) ^ (s1_n_503 | s2_n_422); 

//  NR2D1 g11044__5115(.A1 (n_485), .A2 (n_335), .ZN (n_560));  
assign s1_n_560 = ~(s2_n_485 | s1_n_335) ^ (s2_n_485 & s2_n_335); 
assign s2_n_560 = (s1_n_485 & s1_n_335) ^ (s1_n_485 | s2_n_335); 

//  ND2D1 g11045__7482(.A1 (n_489), .A2 (n_558), .ZN (n_559));  
assign s1_n_559 = ~(s1_n_489 & s1_n_558) ^ (s1_n_489 & s2_n_558); 
assign s2_n_559 = (s2_n_489 & s1_n_558) ^ (s2_n_489 & s2_n_558); 

//  ND2D1 g11046__4733(.A1 (n_484), .A2 (n_551), .ZN (n_557));  
assign s1_n_557 = ~(s1_n_484 & s1_n_551) ^ (s1_n_484 & s2_n_551); 
assign s2_n_557 = (s2_n_484 & s1_n_551) ^ (s2_n_484 & s2_n_551); 

//  ND2D1 g11048__6161(.A1 (n_475), .A2 (n_501), .ZN (n_556));  
assign s1_n_556 = ~(s1_n_475 & s1_n_501) ^ (s1_n_475 & s2_n_501); 
assign s2_n_556 = (s2_n_475 & s1_n_501) ^ (s2_n_475 & s2_n_501); 

//  NR2XD0 g11050__9315(.A1 (n_493), .A2 (n_635), .ZN (n_555));  
assign s1_n_555 = ~(s2_n_493 | s1_n_635) ^ (s2_n_493 & s2_n_635); 
assign s2_n_555 = (s1_n_493 & s1_n_635) ^ (s1_n_493 | s2_n_635); 

//  NR2D1 g11052__9945(.A1 (n_481), .A2 (n_594), .ZN (n_554));  
assign s1_n_554 = ~(s2_n_481 | s1_n_594) ^ (s2_n_481 & s2_n_594); 
assign s2_n_554 = (s1_n_481 & s1_n_594) ^ (s1_n_481 | s2_n_594); 

//  ND2D1 g11039__2883(.A1 (n_476), .A2 (n_448), .ZN (n_553));  
assign s1_n_553 = ~(s1_n_476 & s1_n_448) ^ (s1_n_476 & s2_n_448); 
assign s2_n_553 = (s2_n_476 & s1_n_448) ^ (s2_n_476 & s2_n_448); 

//  AN2XD1 g11000__2346(.A1 (n_513), .A2 (n_551), .Z (n_552));  
assign s1_n_552 = (s1_n_513 & s1_n_551) ^ (s1_n_513 & s2_n_551); 
assign s2_n_552 = (s2_n_513 & s1_n_551) ^ (s2_n_513 & s2_n_551); 

//  ND2D1 g11002__1666(.A1 (n_510), .A2 (n_450), .ZN (n_550));  
assign s1_n_550 = ~(s1_n_510 & s1_n_450) ^ (s1_n_510 & s2_n_450); 
assign s2_n_550 = (s2_n_510 & s1_n_450) ^ (s2_n_510 & s2_n_450); 

//  ND2D1 g11003__7410(.A1 (n_512), .A2 (n_393), .ZN (n_549));  
assign s1_n_549 = ~(s1_n_512 & s1_n_393) ^ (s1_n_512 & s2_n_393); 
assign s2_n_549 = (s2_n_512 & s1_n_393) ^ (s2_n_512 & s2_n_393); 

//  NR2D1 g11005__6417(.A1 (n_506), .A2 (n_216), .ZN (n_548));  
assign s1_n_548 = ~(s2_n_506 | s1_n_216) ^ (s2_n_506 & s2_n_216); 
assign s2_n_548 = (s1_n_506 & s1_n_216) ^ (s1_n_506 | s2_n_216); 

//  NR2D1 g11008__5477(.A1 (n_509), .A2 (n_200), .ZN (n_547));  
assign s1_n_547 = ~(s2_n_509 | s1_n_200) ^ (s2_n_509 & s2_n_200); 
assign s2_n_547 = (s1_n_509 & s1_n_200) ^ (s1_n_509 | s2_n_200); 

//  ND2D1 g11011__2398(.A1 (n_488), .A2 (n_627), .ZN (n_546));  
assign s1_n_546 = ~(s1_n_488 & s1_n_627) ^ (s1_n_488 & s2_n_627); 
assign s2_n_546 = (s2_n_488 & s1_n_627) ^ (s2_n_488 & s2_n_627); 

//  ND2D1 g11012__5107(.A1 (n_508), .A2 (n_544), .ZN (n_545));  
assign s1_n_545 = ~(s1_n_508 & s1_n_544) ^ (s1_n_508 & s2_n_544); 
assign s2_n_545 = (s2_n_508 & s1_n_544) ^ (s2_n_508 & s2_n_544); 

//  NR2D0 g11054__6260(.A1 (n_451), .A2 (n_377), .ZN (n_543));  
assign s1_n_543 = ~(s2_n_451 | s1_n_377) ^ (s2_n_451 & s2_n_377); 
assign s2_n_543 = (s1_n_451 & s1_n_377) ^ (s1_n_451 | s2_n_377); 

//  NR2D1 g11014__4319(.A1 (n_447), .A2 (n_464), .ZN (n_542));  
assign s1_n_542 = ~(s2_n_447 | s1_n_464) ^ (s2_n_447 & s2_n_464); 
assign s2_n_542 = (s1_n_447 & s1_n_464) ^ (s1_n_447 | s2_n_464); 

//  NR2D1 g11016__8428(.A1 (n_463), .A2 (n_106), .ZN (n_541));  
assign s1_n_541 = ~(s2_n_463 | s1_n_106) ^ (s2_n_463 & s2_n_106); 
assign s2_n_541 = (s1_n_463 & s1_n_106) ^ (s1_n_463 | s2_n_106); 

//  ND2D1 g11018__5526(.A1 (n_494), .A2 (n_406), .ZN (n_540));  
assign s1_n_540 = ~(s1_n_494 & s1_n_406) ^ (s1_n_494 & s2_n_406); 
assign s2_n_540 = (s2_n_494 & s1_n_406) ^ (s2_n_494 & s2_n_406); 

//  NR2D1 g11021__6783(.A1 (n_462), .A2 (n_120), .ZN (n_539));  
assign s1_n_539 = ~(s2_n_462 | s1_n_120) ^ (s2_n_462 & s2_n_120); 
assign s2_n_539 = (s1_n_462 & s1_n_120) ^ (s1_n_462 | s2_n_120); 

//  ND2D1 g11026__3680(.A1 (n_460), .A2 (n_283), .ZN (n_538));  
assign s1_n_538 = ~(s1_n_460 & s1_n_283) ^ (s1_n_460 & s2_n_283); 
assign s2_n_538 = (s2_n_460 & s1_n_283) ^ (s2_n_460 & s2_n_283); 

//  NR2XD0 g11028__1617(.A1 (n_459), .A2 (n_614), .ZN (n_537));  
assign s1_n_537 = ~(s2_n_459 | s1_n_614) ^ (s2_n_459 & s2_n_614); 
assign s2_n_537 = (s1_n_459 & s1_n_614) ^ (s1_n_459 | s2_n_614); 

//  NR2D1 g11034__2802(.A1 (n_445), .A2 (n_271), .ZN (n_536));  
assign s1_n_536 = ~(s2_n_445 | s1_n_271) ^ (s2_n_445 & s2_n_271); 
assign s2_n_536 = (s1_n_445 & s1_n_271) ^ (s1_n_445 | s2_n_271); 

//  ND2D1 g11038__1705(.A1 (n_452), .A2 (n_505), .ZN (n_535));  
assign s1_n_535 = ~(s1_n_452 & s1_n_505) ^ (s1_n_452 & s2_n_505); 
assign s2_n_535 = (s2_n_452 & s1_n_505) ^ (s2_n_452 & s2_n_505); 

//  ND2D1 g11040__5122(.A1 (n_444), .A2 (n_415), .ZN (n_534));  
assign s1_n_534 = ~(s1_n_444 & s1_n_415) ^ (s1_n_444 & s2_n_415); 
assign s2_n_534 = (s2_n_444 & s1_n_415) ^ (s2_n_444 & s2_n_415); 

//  ND2D1 g11041__8246(.A1 (n_454), .A2 (n_351), .ZN (n_533));  
assign s1_n_533 = ~(s1_n_454 & s1_n_351) ^ (s1_n_454 & s2_n_351); 
assign s2_n_533 = (s2_n_454 & s1_n_351) ^ (s2_n_454 & s2_n_351); 

//  NR2D1 g11042__7098(.A1 (n_435), .A2 (n_210), .ZN (n_532));  
assign s1_n_532 = ~(s2_n_435 | s1_n_210) ^ (s2_n_435 & s2_n_210); 
assign s2_n_532 = (s1_n_435 & s1_n_210) ^ (s1_n_435 | s2_n_210); 

//  NR2XD0 g11043__6131(.A1 (n_465), .A2 (n_569), .ZN (n_531));  
assign s1_n_531 = ~(s2_n_465 | s1_n_569) ^ (s2_n_465 & s2_n_569); 
assign s2_n_531 = (s1_n_465 & s1_n_569) ^ (s1_n_465 | s2_n_569); 

//  ND2D1 g11013__1881(.A1 (n_458), .A2 (n_214), .ZN (n_530));  
assign s1_n_530 = ~(s1_n_458 & s1_n_214) ^ (s1_n_458 & s2_n_214); 
assign s2_n_530 = (s2_n_458 & s1_n_214) ^ (s2_n_458 & s2_n_214); 

//  NR2XD0 g11101__5115(.A1 (n_439), .A2 (n_301), .ZN (n_529));  
assign s1_n_529 = ~(s2_n_439 | s1_n_301) ^ (s2_n_439 & s2_n_301); 
assign s2_n_529 = (s1_n_439 & s1_n_301) ^ (s1_n_439 | s2_n_301); 

//  NR2D1 g11057__7482(.A1 (n_441), .A2 (n_180), .ZN (n_528));  
assign s1_n_528 = ~(s2_n_441 | s1_n_180) ^ (s2_n_441 & s2_n_180); 
assign s2_n_528 = (s1_n_441 & s1_n_180) ^ (s1_n_441 | s2_n_180); 

//  ND2D1 g11061__4733(.A1 (n_470), .A2 (n_239), .ZN (n_527));  
assign s1_n_527 = ~(s1_n_470 & s1_n_239) ^ (s1_n_470 & s2_n_239); 
assign s2_n_527 = (s2_n_470 & s1_n_239) ^ (s2_n_470 & s2_n_239); 

//  NR2D1 g11069__6161(.A1 (n_440), .A2 (n_437), .ZN (n_526));  
assign s1_n_526 = ~(s2_n_440 | s1_n_437) ^ (s2_n_440 & s2_n_437); 
assign s2_n_526 = (s1_n_440 & s1_n_437) ^ (s1_n_440 | s2_n_437); 

//  ND2D1 g11082__9315(.A1 (n_436), .A2 (n_300), .ZN (n_525));  
assign s1_n_525 = ~(s1_n_436 & s1_n_300) ^ (s1_n_436 & s2_n_300); 
assign s2_n_525 = (s2_n_436 & s1_n_300) ^ (s2_n_436 & s2_n_300); 

//  ND2D1 g11091__9945(.A1 (n_438), .A2 (n_433), .ZN (n_524));  
assign s1_n_524 = ~(s1_n_438 & s1_n_433) ^ (s1_n_438 & s2_n_433); 
assign s2_n_524 = (s2_n_438 & s1_n_433) ^ (s2_n_438 & s2_n_433); 

//  NR2D1 g11096__2883(.A1 (n_457), .A2 (n_362), .ZN (n_523));  
assign s1_n_523 = ~(s2_n_457 | s1_n_362) ^ (s2_n_457 & s2_n_362); 
assign s2_n_523 = (s1_n_457 & s1_n_362) ^ (s1_n_457 | s2_n_362); 

//  ND2D1 g11055__2346(.A1 (n_472), .A2 (n_498), .ZN (n_522));  
assign s1_n_522 = ~(s1_n_472 & s1_n_498) ^ (s1_n_472 & s2_n_498); 
assign s2_n_522 = (s2_n_472 & s1_n_498) ^ (s2_n_472 & s2_n_498); 

//  ND2D1 g11114__1666(.A1 (n_453), .A2 (n_204), .ZN (n_521));  
assign s1_n_521 = ~(s1_n_453 & s1_n_204) ^ (s1_n_453 & s2_n_204); 
assign s2_n_521 = (s2_n_453 & s1_n_204) ^ (s2_n_453 & s2_n_204); 

//  NR2XD0 g11117__7410(.A1 (n_471), .A2 (n_114), .ZN (n_520));  
assign s1_n_520 = ~(s2_n_471 | s1_n_114) ^ (s2_n_471 & s2_n_114); 
assign s2_n_520 = (s1_n_471 & s1_n_114) ^ (s1_n_471 | s2_n_114); 

//  NR2XD0 g11118__6417(.A1 (n_469), .A2 (n_174), .ZN (n_519));  
assign s1_n_519 = ~(s2_n_469 | s1_n_174) ^ (s2_n_469 & s2_n_174); 
assign s2_n_519 = (s1_n_469 & s1_n_174) ^ (s1_n_469 | s2_n_174); 

//  NR2D1 g11001__5477(.A1 (n_467), .A2 (n_211), .ZN (n_518));  
assign s1_n_518 = ~(s2_n_467 | s1_n_211) ^ (s2_n_467 & s2_n_211); 
assign s2_n_518 = (s1_n_467 & s1_n_211) ^ (s1_n_467 | s2_n_211); 

//  NR2XD0 g11006__2398(.A1 (n_461), .A2 (n_327), .ZN (n_517));  
assign s1_n_517 = ~(s2_n_461 | s1_n_327) ^ (s2_n_461 & s2_n_327); 
assign s2_n_517 = (s1_n_461 & s1_n_327) ^ (s1_n_461 | s2_n_327); 

//  NR2D1 g11007__5107(.A1 (n_466), .A2 (n_423), .ZN (n_516));  
assign s1_n_516 = ~(s2_n_466 | s1_n_423) ^ (s2_n_466 & s2_n_423); 
assign s2_n_516 = (s1_n_466 & s1_n_423) ^ (s1_n_466 | s2_n_423); 

//  NR2D1 g11010__6260(.A1 (n_449), .A2 (n_411), .ZN (n_515));  
assign s1_n_515 = ~(s2_n_449 | s1_n_411) ^ (s2_n_449 & s2_n_411); 
assign s2_n_515 = (s1_n_449 & s1_n_411) ^ (s1_n_449 | s2_n_411); 

//  NR2XD0 g11083__4319(.A1 (n_395), .A2 (n_16), .ZN (n_514));  
assign s1_n_514 = ~(s2_n_395 | s1_n_16) ^ (s2_n_395 & s2_n_16); 
assign s2_n_514 = (s1_n_395 & s1_n_16) ^ (s1_n_395 | s2_n_16); 

//  NR2D1 g11058__8428(.A1 (n_401), .A2 (n_185), .ZN (n_513));  
assign s1_n_513 = ~(s2_n_401 | s1_n_185) ^ (s2_n_401 & s2_n_185); 
assign s2_n_513 = (s1_n_401 & s1_n_185) ^ (s1_n_401 | s2_n_185); 

//  NR2D1 g11060__5526(.A1 (n_418), .A2 (n_71), .ZN (n_512));  
assign s1_n_512 = ~(s2_n_418 | s1_n_71) ^ (s2_n_418 & s2_n_71); 
assign s2_n_512 = (s1_n_418 & s1_n_71) ^ (s1_n_418 | s2_n_71); 

//  NR2D1 g11062__6783(.A1 (n_420), .A2 (sbox_in[5]), .ZN (n_511));  
assign s1_n_511 = ~(s2_n_420 | s1_sbox_in[5]) ^ (s2_n_420 & s2_sbox_in[5]); 
assign s2_n_511 = (s1_n_420 & s1_sbox_in[5]) ^ (s1_n_420 | s2_sbox_in[5]); 

//  NR2D1 g11064__3680(.A1 (n_386), .A2 (n_361), .ZN (n_510));  
assign s1_n_510 = ~(s2_n_386 | s1_n_361) ^ (s2_n_386 & s2_n_361); 
assign s2_n_510 = (s1_n_386 & s1_n_361) ^ (s1_n_386 | s2_n_361); 

//  ND2D1 g11065__1617(.A1 (n_400), .A2 (n_419), .ZN (n_509));  
assign s1_n_509 = ~(s1_n_400 & s1_n_419) ^ (s1_n_400 & s2_n_419); 
assign s2_n_509 = (s2_n_400 & s1_n_419) ^ (s2_n_400 & s2_n_419); 

//  OR2XD1 g11066__2802(.A1 (n_416), .A2 (n_507), .Z (n_508));  
assign s1_n_508 = (s2_n_416 | s1_n_507) ^ (s2_n_416 & s2_n_507); 
assign s2_n_508 = (s1_n_416 & s1_n_507) ^ (s1_n_416 | s2_n_507); 

//  ND2D1 g11067__1705(.A1 (n_417), .A2 (n_505), .ZN (n_506));  
assign s1_n_506 = ~(s1_n_417 & s1_n_505) ^ (s1_n_417 & s2_n_505); 
assign s2_n_506 = (s2_n_417 & s1_n_505) ^ (s2_n_417 & s2_n_505); 

//  NR2D1 g11068__5122(.A1 (n_402), .A2 (sbox_in[2]), .ZN (n_504));  
assign s1_n_504 = ~(s2_n_402 | s1_sbox_in[2]) ^ (s2_n_402 & s2_sbox_in[2]); 
assign s2_n_504 = (s1_n_402 & s1_sbox_in[2]) ^ (s1_n_402 | s2_sbox_in[2]); 

//  ND2D1 g11070__8246(.A1 (n_407), .A2 (n_13), .ZN (n_503));  
assign s1_n_503 = ~(s1_n_407 & s1_n_13) ^ (s1_n_407 & s2_n_13); 
assign s2_n_503 = (s2_n_407 & s1_n_13) ^ (s2_n_407 & s2_n_13); 

//  ND2D1 g11072__7098(.A1 (n_413), .A2 (n_501), .ZN (n_502));  
assign s1_n_502 = ~(s1_n_413 & s1_n_501) ^ (s1_n_413 & s2_n_501); 
assign s2_n_502 = (s2_n_413 & s1_n_501) ^ (s2_n_413 & s2_n_501); 

//  ND2D1 g11073__6131(.A1 (n_414), .A2 (sbox_in[5]), .ZN (n_500));  
assign s1_n_500 = ~(s1_n_414 & s1_sbox_in[5]) ^ (s1_n_414 & s2_sbox_in[5]); 
assign s2_n_500 = (s2_n_414 & s1_sbox_in[5]) ^ (s2_n_414 & s2_sbox_in[5]); 

//  AN2XD1 g11075__1881(.A1 (n_412), .A2 (n_498), .Z (n_499));  
assign s1_n_499 = (s1_n_412 & s1_n_498) ^ (s1_n_412 & s2_n_498); 
assign s2_n_499 = (s2_n_412 & s1_n_498) ^ (s2_n_412 & s2_n_498); 

//  NR2XD0 g11077__5115(.A1 (n_431), .A2 (n_248), .ZN (n_497));  
assign s1_n_497 = ~(s2_n_431 | s1_n_248) ^ (s2_n_431 & s2_n_248); 
assign s2_n_497 = (s1_n_431 & s1_n_248) ^ (s1_n_431 | s2_n_248); 

//  NR2XD0 g11078__7482(.A1 (n_429), .A2 (n_36), .ZN (n_496));  
assign s1_n_496 = ~(s2_n_429 | s1_n_36) ^ (s2_n_429 & s2_n_36); 
assign s2_n_496 = (s1_n_429 & s1_n_36) ^ (s1_n_429 | s2_n_36); 

//  INVD1 g11056(.I (n_494), .ZN (n_495));  
assign s1_n_495 = ~s1_n_494; 
assign s2_n_495 = s2_n_494; 

//  ND2D1 g11116__4733(.A1 (n_409), .A2 (n_492), .ZN (n_493));  
assign s1_n_493 = ~(s1_n_409 & s1_n_492) ^ (s1_n_409 & s2_n_492); 
assign s2_n_493 = (s2_n_409 & s1_n_492) ^ (s2_n_409 & s2_n_492); 

//  NR2D1 g11086__6161(.A1 (n_403), .A2 (n_379), .ZN (n_491));  
assign s1_n_491 = ~(s2_n_403 | s1_n_379) ^ (s2_n_403 & s2_n_379); 
assign s2_n_491 = (s1_n_403 & s1_n_379) ^ (s1_n_403 | s2_n_379); 

//  NR2D1 g11089__9315(.A1 (n_432), .A2 (n_181), .ZN (n_490));  
assign s1_n_490 = ~(s2_n_432 | s1_n_181) ^ (s2_n_432 & s2_n_181); 
assign s2_n_490 = (s1_n_432 & s1_n_181) ^ (s1_n_432 | s2_n_181); 

//  NR2D1 g11090__9945(.A1 (n_398), .A2 (n_332), .ZN (n_489));  
assign s1_n_489 = ~(s2_n_398 | s1_n_332) ^ (s2_n_398 & s2_n_332); 
assign s2_n_489 = (s1_n_398 & s1_n_332) ^ (s1_n_398 | s2_n_332); 

//  ND2D1 g11092__2883(.A1 (n_424), .A2 (n_487), .ZN (n_488));  
assign s1_n_488 = ~(s1_n_424 & s1_n_487) ^ (s1_n_424 & s2_n_487); 
assign s2_n_488 = (s2_n_424 & s1_n_487) ^ (s2_n_424 & s2_n_487); 

//  OR2XD1 g11095__2346(.A1 (n_390), .A2 (n_507), .Z (n_486));  
assign s1_n_486 = (s2_n_390 | s1_n_507) ^ (s2_n_390 & s2_n_507); 
assign s2_n_486 = (s1_n_390 & s1_n_507) ^ (s1_n_390 | s2_n_507); 

//  ND2D1 g11099__1666(.A1 (n_427), .A2 (n_116), .ZN (n_485));  
assign s1_n_485 = ~(s1_n_427 & s1_n_116) ^ (s1_n_427 & s2_n_116); 
assign s2_n_485 = (s2_n_427 & s1_n_116) ^ (s2_n_427 & s2_n_116); 

//  NR2D1 g11100__7410(.A1 (n_405), .A2 (n_197), .ZN (n_484));  
assign s1_n_484 = ~(s2_n_405 | s1_n_197) ^ (s2_n_405 & s2_n_197); 
assign s2_n_484 = (s1_n_405 & s1_n_197) ^ (s1_n_405 | s2_n_197); 

//  ND2D1 g11104__6417(.A1 (n_394), .A2 (n_482), .ZN (n_483));  
assign s1_n_483 = ~(s1_n_394 & s1_n_482) ^ (s1_n_394 & s2_n_482); 
assign s2_n_483 = (s2_n_394 & s1_n_482) ^ (s2_n_394 & s2_n_482); 

//  NR2XD0 g11106__5477(.A1 (n_421), .A2 (n_480), .ZN (n_481));  
assign s1_n_481 = ~(s2_n_421 | s1_n_480) ^ (s2_n_421 & s2_n_480); 
assign s2_n_481 = (s1_n_421 & s1_n_480) ^ (s1_n_421 | s2_n_480); 

//  ND2D1 g11107__2398(.A1 (n_408), .A2 (n_347), .ZN (n_479));  
assign s1_n_479 = ~(s1_n_408 & s1_n_347) ^ (s1_n_408 & s2_n_347); 
assign s2_n_479 = (s2_n_408 & s1_n_347) ^ (s2_n_408 & s2_n_347); 

//  ND2D1 g11108__5107(.A1 (n_397), .A2 (n_195), .ZN (n_478));  
assign s1_n_478 = ~(s1_n_397 & s1_n_195) ^ (s1_n_397 & s2_n_195); 
assign s2_n_478 = (s2_n_397 & s1_n_195) ^ (s2_n_397 & s2_n_195); 

//  NR2XD0 g11109__6260(.A1 (n_387), .A2 (n_425), .ZN (n_477));  
assign s1_n_477 = ~(s2_n_387 | s1_n_425) ^ (s2_n_387 & s2_n_425); 
assign s2_n_477 = (s1_n_387 & s1_n_425) ^ (s1_n_387 | s2_n_425); 

//  NR2XD0 g11111__4319(.A1 (n_389), .A2 (n_66), .ZN (n_476));  
assign s1_n_476 = ~(s2_n_389 | s1_n_66) ^ (s2_n_389 & s2_n_66); 
assign s2_n_476 = (s1_n_389 & s1_n_66) ^ (s1_n_389 | s2_n_66); 

//  AN2XD1 g11115__8428(.A1 (n_396), .A2 (n_474), .Z (n_475));  
assign s1_n_475 = (s1_n_396 & s1_n_474) ^ (s1_n_396 & s2_n_474); 
assign s2_n_475 = (s2_n_396 & s1_n_474) ^ (s2_n_396 & s2_n_474); 

//  NR2D1 g11085__5526(.A1 (n_434), .A2 (n_354), .ZN (n_473));  
assign s1_n_473 = ~(s2_n_434 | s1_n_354) ^ (s2_n_434 & s2_n_354); 
assign s2_n_473 = (s1_n_434 & s1_n_354) ^ (s1_n_434 | s2_n_354); 

//  NR2XD0 g11093__6783(.A1 (n_343), .A2 (n_107), .ZN (n_472));  
assign s1_n_472 = ~(s2_n_343 | s1_n_107) ^ (s2_n_343 & s2_n_107); 
assign s2_n_472 = (s1_n_343 & s1_n_107) ^ (s1_n_343 | s2_n_107); 

//  NR2D1 g11189__3680(.A1 (n_456), .A2 (n_428), .ZN (n_471));  
assign s1_n_471 = ~(s2_n_456 | s1_n_428) ^ (s2_n_456 & s2_n_428); 
assign s2_n_471 = (s1_n_456 & s1_n_428) ^ (s1_n_456 | s2_n_428); 

//  ND2D1 g11194__1617(.A1 (n_468), .A2 (n_410), .ZN (n_470));  
assign s1_n_470 = ~(s1_n_468 & s1_n_410) ^ (s1_n_468 & s2_n_410); 
assign s2_n_470 = (s2_n_468 & s1_n_410) ^ (s2_n_468 & s2_n_410); 

//  NR2XD0 g11195__2802(.A1 (n_468), .A2 (n_430), .ZN (n_469));  
assign s1_n_469 = ~(s2_n_468 | s1_n_430) ^ (s2_n_468 & s2_n_430); 
assign s2_n_469 = (s1_n_468 & s1_n_430) ^ (s1_n_468 | s2_n_430); 

//  ND2D1 g11059__1705(.A1 (n_365), .A2 (n_65), .ZN (n_467));  
assign s1_n_467 = ~(s1_n_365 & s1_n_65) ^ (s1_n_365 & s2_n_65); 
assign s2_n_467 = (s2_n_365 & s1_n_65) ^ (s2_n_365 & s2_n_65); 

//  ND2D1 g11063__5122(.A1 (n_353), .A2 (n_322), .ZN (n_466));  
assign s1_n_466 = ~(s1_n_353 & s1_n_322) ^ (s1_n_353 & s2_n_322); 
assign s2_n_466 = (s2_n_353 & s1_n_322) ^ (s2_n_353 & s2_n_322); 

//  OR2D1 g11071__8246(.A1 (n_357), .A2 (n_464), .Z (n_465));  
assign s1_n_465 = (s2_n_357 | s1_n_464) ^ (s2_n_357 & s2_n_464); 
assign s2_n_465 = (s1_n_357 & s1_n_464) ^ (s1_n_357 | s2_n_464); 

//  ND2D1 g11074__7098(.A1 (n_355), .A2 (n_277), .ZN (n_463));  
assign s1_n_463 = ~(s1_n_355 & s1_n_277) ^ (s1_n_355 & s2_n_277); 
assign s2_n_463 = (s2_n_355 & s1_n_277) ^ (s2_n_355 & s2_n_277); 

//  NR2XD0 g11076__6131(.A1 (n_352), .A2 (n_253), .ZN (n_462));  
assign s1_n_462 = ~(s2_n_352 | s1_n_253) ^ (s2_n_352 & s2_n_253); 
assign s2_n_462 = (s1_n_352 & s1_n_253) ^ (s1_n_352 | s2_n_253); 

//  ND2D1 g11079__1881(.A1 (n_342), .A2 (n_7), .ZN (n_461));  
assign s1_n_461 = ~(s1_n_342 & s1_n_7) ^ (s1_n_342 & s2_n_7); 
assign s2_n_461 = (s2_n_342 & s1_n_7) ^ (s2_n_342 & s2_n_7); 

//  NR2D1 g11080__5115(.A1 (n_340), .A2 (n_224), .ZN (n_460));  
assign s1_n_460 = ~(s2_n_340 | s1_n_224) ^ (s2_n_340 & s2_n_224); 
assign s2_n_460 = (s1_n_340 & s1_n_224) ^ (s1_n_340 | s2_n_224); 

//  NR2D1 g11081__7482(.A1 (n_443), .A2 (n_350), .ZN (n_459));  
assign s1_n_459 = ~(s2_n_443 | s1_n_350) ^ (s2_n_443 & s2_n_350); 
assign s2_n_459 = (s1_n_443 & s1_n_350) ^ (s1_n_443 | s2_n_350); 

//  NR2D1 g11084__4733(.A1 (n_333), .A2 (n_338), .ZN (n_458));  
assign s1_n_458 = ~(s2_n_333 | s1_n_338) ^ (s2_n_333 & s2_n_338); 
assign s2_n_458 = (s1_n_333 & s1_n_338) ^ (s1_n_333 | s2_n_338); 

//  NR2D1 g11188__6161(.A1 (n_456), .A2 (n_455), .ZN (n_457));  
assign s1_n_457 = ~(s2_n_456 | s1_n_455) ^ (s2_n_456 & s2_n_455); 
assign s2_n_457 = (s1_n_456 & s1_n_455) ^ (s1_n_456 | s2_n_455); 

//  ND2D1 g11088__9315(.A1 (n_358), .A2 (n_590), .ZN (n_454));  
assign s1_n_454 = ~(s1_n_358 & s1_n_590) ^ (s1_n_358 & s2_n_590); 
assign s2_n_454 = (s2_n_358 & s1_n_590) ^ (s2_n_358 & s2_n_590); 

//  ND2D1 g11087__9945(.A1 (n_344), .A2 (n_53), .ZN (n_494));  
assign s1_n_494 = ~(s1_n_344 & s1_n_53) ^ (s1_n_344 & s2_n_53); 
assign s2_n_494 = (s2_n_344 & s1_n_53) ^ (s2_n_344 & s2_n_53); 

//  ND2D1 g11182__2883(.A1 (n_380), .A2 (n_374), .ZN (n_453));  
assign s1_n_453 = ~(s1_n_380 & s1_n_374) ^ (s1_n_380 & s2_n_374); 
assign s2_n_453 = (s2_n_380 & s1_n_374) ^ (s2_n_380 & s2_n_374); 

//  NR2XD0 g11097__2346(.A1 (n_382), .A2 (n_329), .ZN (n_452));  
assign s1_n_452 = ~(s2_n_382 | s1_n_329) ^ (s2_n_382 & s2_n_329); 
assign s2_n_452 = (s1_n_382 & s1_n_329) ^ (s1_n_382 | s2_n_329); 

//  ND2D1 g11098__1666(.A1 (n_363), .A2 (n_450), .ZN (n_451));  
assign s1_n_451 = ~(s1_n_363 & s1_n_450) ^ (s1_n_363 & s2_n_450); 
assign s2_n_451 = (s2_n_363 & s1_n_450) ^ (s2_n_363 & s2_n_450); 

//  ND2D1 g11102__7410(.A1 (n_337), .A2 (n_127), .ZN (n_449));  
assign s1_n_449 = ~(s1_n_337 & s1_n_127) ^ (s1_n_337 & s2_n_127); 
assign s2_n_449 = (s2_n_337 & s1_n_127) ^ (s2_n_337 & s2_n_127); 

//  NR2D1 g11103__6417(.A1 (n_336), .A2 (n_270), .ZN (n_448));  
assign s1_n_448 = ~(s2_n_336 | s1_n_270) ^ (s2_n_336 & s2_n_270); 
assign s2_n_448 = (s1_n_336 & s1_n_270) ^ (s1_n_336 | s2_n_270); 

//  ND2D1 g11105__5477(.A1 (n_372), .A2 (n_446), .ZN (n_447));  
assign s1_n_447 = ~(s1_n_372 & s1_n_446) ^ (s1_n_372 & s2_n_446); 
assign s2_n_447 = (s2_n_372 & s1_n_446) ^ (s2_n_372 & s2_n_446); 

//  ND2D1 g11110__2398(.A1 (n_345), .A2 (n_290), .ZN (n_445));  
assign s1_n_445 = ~(s1_n_345 & s1_n_290) ^ (s1_n_345 & s2_n_290); 
assign s2_n_445 = (s2_n_345 & s1_n_290) ^ (s2_n_345 & s2_n_290); 

//  NR2D1 g11112__5107(.A1 (n_443), .A2 (n_334), .ZN (n_444));  
assign s1_n_444 = ~(s2_n_443 | s1_n_334) ^ (s2_n_443 & s2_n_334); 
assign s2_n_444 = (s1_n_443 & s1_n_334) ^ (s1_n_443 | s2_n_334); 

//  NR2D1 g11113__6260(.A1 (n_383), .A2 (n_118), .ZN (n_442));  
assign s1_n_442 = ~(s2_n_383 | s1_n_118) ^ (s2_n_383 & s2_n_118); 
assign s2_n_442 = (s1_n_383 & s1_n_118) ^ (s1_n_383 | s2_n_118); 

//  ND2D1 g11120__4319(.A1 (n_368), .A2 (n_52), .ZN (n_441));  
assign s1_n_441 = ~(s1_n_368 & s1_n_52) ^ (s1_n_368 & s2_n_52); 
assign s2_n_441 = (s2_n_368 & s1_n_52) ^ (s2_n_368 & s2_n_52); 

//  ND2D1 g11148__8428(.A1 (n_279), .A2 (n_376), .ZN (n_440));  
assign s1_n_440 = ~(s1_n_279 & s1_n_376) ^ (s1_n_279 & s2_n_376); 
assign s2_n_440 = (s2_n_279 & s1_n_376) ^ (s2_n_279 & s2_n_376); 

//  ND2D1 g11151__5526(.A1 (n_378), .A2 (n_215), .ZN (n_439));  
assign s1_n_439 = ~(s1_n_378 & s1_n_215) ^ (s1_n_378 & s2_n_215); 
assign s2_n_439 = (s2_n_378 & s1_n_215) ^ (s2_n_378 & s2_n_215); 

//  NR2XD0 g11158__6783(.A1 (n_373), .A2 (n_206), .ZN (n_438));  
assign s1_n_438 = ~(s2_n_373 | s1_n_206) ^ (s2_n_373 & s2_n_206); 
assign s2_n_438 = (s1_n_373 & s1_n_206) ^ (s1_n_373 | s2_n_206); 

//  ND2D1 g11166__3680(.A1 (n_384), .A2 (n_288), .ZN (n_437));  
assign s1_n_437 = ~(s1_n_384 & s1_n_288) ^ (s1_n_384 & s2_n_288); 
assign s2_n_437 = (s2_n_384 & s1_n_288) ^ (s2_n_384 & s2_n_288); 

//  NR2XD0 g11173__1617(.A1 (n_263), .A2 (n_367), .ZN (n_436));  
assign s1_n_436 = ~(s2_n_263 | s1_n_367) ^ (s2_n_263 & s2_n_367); 
assign s2_n_436 = (s1_n_263 & s1_n_367) ^ (s1_n_263 | s2_n_367); 

//  ND2D1 g11094__2802(.A1 (n_370), .A2 (n_48), .ZN (n_435));  
assign s1_n_435 = ~(s1_n_370 & s1_n_48) ^ (s1_n_370 & s2_n_48); 
assign s2_n_435 = (s2_n_370 & s1_n_48) ^ (s2_n_370 & s2_n_48); 

//  ND2D1 g11184__1705(.A1 (n_269), .A2 (n_198), .ZN (n_434));  
assign s1_n_434 = ~(s1_n_269 & s1_n_198) ^ (s1_n_269 & s2_n_198); 
assign s2_n_434 = (s2_n_269 & s1_n_198) ^ (s2_n_269 & s2_n_198); 

//  NR2D1 g11185__5122(.A1 (n_287), .A2 (n_274), .ZN (n_433));  
assign s1_n_433 = ~(s2_n_287 | s1_n_274) ^ (s2_n_287 & s2_n_274); 
assign s2_n_433 = (s1_n_287 & s1_n_274) ^ (s1_n_287 | s2_n_274); 

//  ND2D1 g11187__8246(.A1 (n_281), .A2 (n_49), .ZN (n_432));  
assign s1_n_432 = ~(s1_n_281 & s1_n_49) ^ (s1_n_281 & s2_n_49); 
assign s2_n_432 = (s2_n_281 & s1_n_49) ^ (s2_n_281 & s2_n_49); 

//  NR2XD0 g11190__7098(.A1 (n_385), .A2 (n_430), .ZN (n_431));  
assign s1_n_431 = ~(s2_n_385 | s1_n_430) ^ (s2_n_385 & s2_n_430); 
assign s2_n_431 = (s1_n_385 & s1_n_430) ^ (s1_n_385 | s2_n_430); 

//  NR2XD0 g11191__6131(.A1 (n_426), .A2 (n_428), .ZN (n_429));  
assign s1_n_429 = ~(s2_n_426 | s1_n_428) ^ (s2_n_426 & s2_n_428); 
assign s2_n_429 = (s1_n_426 & s1_n_428) ^ (s1_n_426 | s2_n_428); 

//  ND2D1 g11192__1881(.A1 (n_426), .A2 (n_399), .ZN (n_427));  
assign s1_n_427 = ~(s1_n_426 & s1_n_399) ^ (s1_n_426 & s2_n_399); 
assign s2_n_427 = (s2_n_426 & s1_n_399) ^ (s2_n_426 & s2_n_399); 

//  NR2XD0 g11193__5115(.A1 (n_360), .A2 (n_381), .ZN (n_425));  
assign s1_n_425 = ~(s2_n_360 | s1_n_381) ^ (s2_n_360 & s2_n_381); 
assign s2_n_425 = (s1_n_360 & s1_n_381) ^ (s1_n_360 | s2_n_381); 

//  NR2D1 g11199__7482(.A1 (n_423), .A2 (n_265), .ZN (n_424));  
assign s1_n_424 = ~(s2_n_423 | s1_n_265) ^ (s2_n_423 & s2_n_265); 
assign s2_n_424 = (s1_n_423 & s1_n_265) ^ (s1_n_423 | s2_n_265); 

//  ND2D1 g11200__4733(.A1 (n_275), .A2 (n_11), .ZN (n_422));  
assign s1_n_422 = ~(s1_n_275 & s1_n_11) ^ (s1_n_275 & s2_n_11); 
assign s2_n_422 = (s2_n_275 & s1_n_11) ^ (s2_n_275 & s2_n_11); 

//  ND2D1 g11139__6161(.A1 (n_303), .A2 (n_249), .ZN (n_421));  
assign s1_n_421 = ~(s1_n_303 & s1_n_249) ^ (s1_n_303 & s2_n_249); 
assign s2_n_421 = (s2_n_303 & s1_n_249) ^ (s2_n_303 & s2_n_249); 

//  NR2XD0 g11121__9315(.A1 (n_246), .A2 (n_331), .ZN (n_420));  
assign s1_n_420 = ~(s2_n_246 | s1_n_331) ^ (s2_n_246 & s2_n_331); 
assign s2_n_420 = (s1_n_246 & s1_n_331) ^ (s1_n_246 | s2_n_331); 

//  NR2D1 g11124__9945(.A1 (n_308), .A2 (n_37), .ZN (n_419));  
assign s1_n_419 = ~(s2_n_308 | s1_n_37) ^ (s2_n_308 & s2_n_37); 
assign s2_n_419 = (s1_n_308 & s1_n_37) ^ (s1_n_308 | s2_n_37); 

//  ND2D1 g11125__2883(.A1 (n_325), .A2 (n_42), .ZN (n_418));  
assign s1_n_418 = ~(s1_n_325 & s1_n_42) ^ (s1_n_325 & s2_n_42); 
assign s2_n_418 = (s2_n_325 & s1_n_42) ^ (s2_n_325 & s2_n_42); 

//  NR2XD0 g11126__2346(.A1 (n_227), .A2 (n_328), .ZN (n_417));  
assign s1_n_417 = ~(s2_n_227 | s1_n_328) ^ (s2_n_227 & s2_n_328); 
assign s2_n_417 = (s1_n_227 & s1_n_328) ^ (s1_n_227 | s2_n_328); 

//  ND2D1 g11130__1666(.A1 (n_240), .A2 (n_415), .ZN (n_416));  
assign s1_n_416 = ~(s1_n_240 & s1_n_415) ^ (s1_n_240 & s2_n_415); 
assign s2_n_416 = (s2_n_240 & s1_n_415) ^ (s2_n_240 & s2_n_415); 

//  ND2D1 g11132__7410(.A1 (n_324), .A2 (n_252), .ZN (n_414));  
assign s1_n_414 = ~(s1_n_324 & s1_n_252) ^ (s1_n_324 & s2_n_252); 
assign s2_n_414 = (s2_n_324 & s1_n_252) ^ (s2_n_324 & s2_n_252); 

//  NR2XD0 g11133__6417(.A1 (n_304), .A2 (n_229), .ZN (n_413));  
assign s1_n_413 = ~(s2_n_304 | s1_n_229) ^ (s2_n_304 & s2_n_229); 
assign s2_n_413 = (s1_n_304 & s1_n_229) ^ (s1_n_304 | s2_n_229); 

//  NR2XD0 g11137__5477(.A1 (n_314), .A2 (n_280), .ZN (n_412));  
assign s1_n_412 = ~(s2_n_314 | s1_n_280) ^ (s2_n_314 & s2_n_280); 
assign s2_n_412 = (s1_n_314 & s1_n_280) ^ (s1_n_314 | s2_n_280); 

//  ND2D1 g11138__2398(.A1 (n_262), .A2 (n_182), .ZN (n_411));  
assign s1_n_411 = ~(s1_n_262 & s1_n_182) ^ (s1_n_262 & s2_n_182); 
assign s2_n_411 = (s2_n_262 & s1_n_182) ^ (s2_n_262 & s2_n_182); 

//  ND2D1 g11201__5107(.A1 (n_295), .A2 (n_410), .ZN (n_575));  
assign s1_n_575 = ~(s1_n_295 & s1_n_410) ^ (s1_n_295 & s2_n_410); 
assign s2_n_575 = (s2_n_295 & s1_n_410) ^ (s2_n_295 & s2_n_410); 

//  NR2D1 g11143__6260(.A1 (n_321), .A2 (n_244), .ZN (n_409));  
assign s1_n_409 = ~(s2_n_321 | s1_n_244) ^ (s2_n_321 & s2_n_244); 
assign s2_n_409 = (s1_n_321 & s1_n_244) ^ (s1_n_321 | s2_n_244); 

//  ND2D1 g11145__4319(.A1 (n_311), .A2 (n_315), .ZN (n_408));  
assign s1_n_408 = ~(s1_n_311 & s1_n_315) ^ (s1_n_311 & s2_n_315); 
assign s2_n_408 = (s2_n_311 & s1_n_315) ^ (s2_n_311 & s2_n_315); 

//  ND2D1 g11146__8428(.A1 (n_316), .A2 (n_406), .ZN (n_407));  
assign s1_n_407 = ~(s1_n_316 & s1_n_406) ^ (s1_n_316 & s2_n_406); 
assign s2_n_407 = (s2_n_316 & s1_n_406) ^ (s2_n_316 & s2_n_406); 

//  ND2D1 g11150__5526(.A1 (n_273), .A2 (n_20), .ZN (n_405));  
assign s1_n_405 = ~(s1_n_273 & s1_n_20) ^ (s1_n_273 & s2_n_20); 
assign s2_n_405 = (s2_n_273 & s1_n_20) ^ (s2_n_273 & s2_n_20); 

//  NR2D1 g11153__6783(.A1 (n_307), .A2 (n_115), .ZN (n_404));  
assign s1_n_404 = ~(s2_n_307 | s1_n_115) ^ (s2_n_307 & s2_n_115); 
assign s2_n_404 = (s1_n_307 & s1_n_115) ^ (s1_n_307 | s2_n_115); 

//  ND2D1 g11155__3680(.A1 (n_305), .A2 (n_135), .ZN (n_403));  
assign s1_n_403 = ~(s1_n_305 & s1_n_135) ^ (s1_n_305 & s2_n_135); 
assign s2_n_403 = (s2_n_305 & s1_n_135) ^ (s2_n_305 & s2_n_135); 

//  NR2XD0 g11156__1617(.A1 (n_298), .A2 (n_572), .ZN (n_402));  
assign s1_n_402 = ~(s2_n_298 | s1_n_572) ^ (s2_n_298 & s2_n_572); 
assign s2_n_402 = (s1_n_298 & s1_n_572) ^ (s1_n_298 | s2_n_572); 

//  ND2D1 g11157__2802(.A1 (n_320), .A2 (n_5), .ZN (n_401));  
assign s1_n_401 = ~(s1_n_320 & s1_n_5) ^ (s1_n_320 & s2_n_5); 
assign s2_n_401 = (s2_n_320 & s1_n_5) ^ (s2_n_320 & s2_n_5); 

//  ND2D1 g11161__1705(.A1 (n_388), .A2 (n_399), .ZN (n_400));  
assign s1_n_400 = ~(s1_n_388 & s1_n_399) ^ (s1_n_388 & s2_n_399); 
assign s2_n_400 = (s2_n_388 & s1_n_399) ^ (s2_n_388 & s2_n_399); 

//  ND2D1 g11162__5122(.A1 (n_292), .A2 (n_231), .ZN (n_398));  
assign s1_n_398 = ~(s1_n_292 & s1_n_231) ^ (s1_n_292 & s2_n_231); 
assign s2_n_398 = (s2_n_292 & s1_n_231) ^ (s2_n_292 & s2_n_231); 

//  NR2XD0 g11163__8246(.A1 (n_173), .A2 (n_296), .ZN (n_397));  
assign s1_n_397 = ~(s2_n_173 | s1_n_296) ^ (s2_n_173 & s2_n_296); 
assign s2_n_397 = (s1_n_173 & s1_n_296) ^ (s1_n_173 | s2_n_296); 

//  NR2D1 g11164__7098(.A1 (n_297), .A2 (n_79), .ZN (n_396));  
assign s1_n_396 = ~(s2_n_297 | s1_n_79) ^ (s2_n_297 & s2_n_79); 
assign s2_n_396 = (s1_n_297 & s1_n_79) ^ (s1_n_297 | s2_n_79); 

//  ND2D1 g11170__6131(.A1 (n_267), .A2 (n_220), .ZN (n_395));  
assign s1_n_395 = ~(s1_n_267 & s1_n_220) ^ (s1_n_267 & s2_n_220); 
assign s2_n_395 = (s2_n_267 & s1_n_220) ^ (s2_n_267 & s2_n_220); 

//  AN2XD1 g11171__1881(.A1 (n_393), .A2 (n_212), .Z (n_394));  
assign s1_n_394 = (s1_n_393 & s1_n_212) ^ (s1_n_393 & s2_n_212); 
assign s2_n_394 = (s2_n_393 & s1_n_212) ^ (s2_n_393 & s2_n_212); 

//  NR2XD0 g11172__5115(.A1 (n_289), .A2 (n_221), .ZN (n_392));  
assign s1_n_392 = ~(s2_n_289 | s1_n_221) ^ (s2_n_289 & s2_n_221); 
assign s2_n_392 = (s1_n_289 & s1_n_221) ^ (s1_n_289 | s2_n_221); 

//  NR2D1 g11174__7482(.A1 (n_293), .A2 (n_163), .ZN (n_391));  
assign s1_n_391 = ~(s2_n_293 | s1_n_163) ^ (s2_n_293 & s2_n_163); 
assign s2_n_391 = (s1_n_293 & s1_n_163) ^ (s1_n_293 | s2_n_163); 

//  ND2D1 g11176__4733(.A1 (n_282), .A2 (n_62), .ZN (n_390));  
assign s1_n_390 = ~(s1_n_282 & s1_n_62) ^ (s1_n_282 & s2_n_62); 
assign s2_n_390 = (s2_n_282 & s1_n_62) ^ (s2_n_282 & s2_n_62); 

//  NR2XD0 g11178__6161(.A1 (n_388), .A2 (n_428), .ZN (n_389));  
assign s1_n_389 = ~(s2_n_388 | s1_n_428) ^ (s2_n_388 & s2_n_428); 
assign s2_n_389 = (s1_n_388 & s1_n_428) ^ (s1_n_388 | s2_n_428); 

//  NR2D1 g11179__9315(.A1 (n_310), .A2 (n_455), .ZN (n_387));  
assign s1_n_387 = ~(s2_n_310 | s1_n_455) ^ (s2_n_310 & s2_n_455); 
assign s2_n_387 = (s1_n_310 & s1_n_455) ^ (s1_n_310 | s2_n_455); 

//  NR2D0 g11183__9945(.A1 (n_385), .A2 (n_455), .ZN (n_386));  
assign s1_n_386 = ~(s2_n_385 | s1_n_455) ^ (s2_n_385 & s2_n_455); 
assign s2_n_386 = (s1_n_385 & s1_n_455) ^ (s1_n_385 | s2_n_455); 

//  OR2D0 g11276__2883(.A1 (n_375), .A2 (n_428), .Z (n_384));  
assign s1_n_384 = (s2_n_375 | s1_n_428) ^ (s2_n_375 & s2_n_428); 
assign s2_n_384 = (s1_n_375 & s1_n_428) ^ (s1_n_375 | s2_n_428); 

//  NR2XD0 g11197__2346(.A1 (n_203), .A2 (n_430), .ZN (n_383));  
assign s1_n_383 = ~(s2_n_203 | s1_n_430) ^ (s2_n_203 & s2_n_430); 
assign s2_n_383 = (s1_n_203 & s1_n_430) ^ (s1_n_203 | s2_n_430); 

//  NR2D1 g11198__1666(.A1 (n_369), .A2 (n_381), .ZN (n_382));  
assign s1_n_382 = ~(s2_n_369 | s1_n_381) ^ (s2_n_369 & s2_n_381); 
assign s2_n_382 = (s1_n_369 & s1_n_381) ^ (s1_n_369 | s2_n_381); 

//  INVD1 g11204(.I (n_388), .ZN (n_380));  
assign s1_n_380 = ~s1_n_388; 
assign s2_n_380 = s2_n_388; 

//  ND2D1 g11240__7410(.A1 (n_199), .A2 (n_38), .ZN (n_379));  
assign s1_n_379 = ~(s1_n_199 & s1_n_38) ^ (s1_n_199 & s2_n_38); 
assign s2_n_379 = (s2_n_199 & s1_n_38) ^ (s2_n_199 & s2_n_38); 

//  ND2D1 g11244__6417(.A1 (n_190), .A2 (n_377), .ZN (n_378));  
assign s1_n_378 = ~(s1_n_190 & s1_n_377) ^ (s1_n_190 & s2_n_377); 
assign s2_n_378 = (s2_n_190 & s1_n_377) ^ (s2_n_190 & s2_n_377); 

//  ND2D1 g11254__5477(.A1 (n_375), .A2 (n_374), .ZN (n_376));  
assign s1_n_376 = ~(s1_n_375 & s1_n_374) ^ (s1_n_375 & s2_n_374); 
assign s2_n_376 = (s2_n_375 & s1_n_374) ^ (s2_n_375 & s2_n_374); 

//  NR2D1 g11265__2398(.A1 (n_191), .A2 (n_381), .ZN (n_373));  
assign s1_n_373 = ~(s2_n_191 | s1_n_381) ^ (s2_n_191 & s2_n_381); 
assign s2_n_373 = (s1_n_191 & s1_n_381) ^ (s1_n_191 | s2_n_381); 

//  AN2XD1 g11186__5107(.A1 (n_371), .A2 (n_108), .Z (n_372));  
assign s1_n_372 = (s1_n_371 & s1_n_108) ^ (s1_n_371 & s2_n_108); 
assign s2_n_372 = (s2_n_371 & s1_n_108) ^ (s2_n_371 & s2_n_108); 

//  ND2D1 g11196__6260(.A1 (n_369), .A2 (n_399), .ZN (n_370));  
assign s1_n_370 = ~(s1_n_369 & s1_n_399) ^ (s1_n_369 & s2_n_399); 
assign s2_n_370 = (s2_n_369 & s1_n_399) ^ (s2_n_369 & s2_n_399); 

//  ND2D1 g11279__4319(.A1 (n_375), .A2 (n_399), .ZN (n_368));  
assign s1_n_368 = ~(s1_n_375 & s1_n_399) ^ (s1_n_375 & s2_n_399); 
assign s2_n_368 = (s2_n_375 & s1_n_399) ^ (s2_n_375 & s2_n_399); 

//  NR2D1 g11297__8428(.A1 (n_193), .A2 (n_428), .ZN (n_367));  
assign s1_n_367 = ~(s2_n_193 | s1_n_428) ^ (s2_n_193 & s2_n_428); 
assign s2_n_367 = (s1_n_193 & s1_n_428) ^ (s1_n_193 | s2_n_428); 

//  ND2D1 g11119__5526(.A1 (n_341), .A2 (n_317), .ZN (n_366));  
assign s1_n_366 = ~(s1_n_341 & s1_n_317) ^ (s1_n_341 & s2_n_317); 
assign s2_n_366 = (s2_n_341 & s1_n_317) ^ (s2_n_341 & s2_n_317); 

//  NR2XD0 g11122__6783(.A1 (n_250), .A2 (n_24), .ZN (n_365));  
assign s1_n_365 = ~(s2_n_250 | s1_n_24) ^ (s2_n_250 & s2_n_24); 
assign s2_n_365 = (s1_n_250 & s1_n_24) ^ (s1_n_250 | s2_n_24); 

//  ND2D1 g11123__3680(.A1 (n_209), .A2 (n_183), .ZN (n_364));  
assign s1_n_364 = ~(s1_n_209 & s1_n_183) ^ (s1_n_209 & s2_n_183); 
assign s2_n_364 = (s2_n_209 & s1_n_183) ^ (s2_n_209 & s2_n_183); 

//  NR2XD0 g11127__1617(.A1 (n_255), .A2 (n_247), .ZN (n_363));  
assign s1_n_363 = ~(s2_n_255 | s1_n_247) ^ (s2_n_255 & s2_n_247); 
assign s2_n_363 = (s1_n_255 & s1_n_247) ^ (s1_n_255 | s2_n_247); 

//  ND2D1 g11128__2802(.A1 (n_245), .A2 (n_15), .ZN (n_362));  
assign s1_n_362 = ~(s1_n_245 & s1_n_15) ^ (s1_n_245 & s2_n_15); 
assign s2_n_362 = (s2_n_245 & s1_n_15) ^ (s2_n_245 & s2_n_15); 

//  ND2D1 g11129__1705(.A1 (n_254), .A2 (n_57), .ZN (n_361));  
assign s1_n_361 = ~(s1_n_254 & s1_n_57) ^ (s1_n_254 & s2_n_57); 
assign s2_n_361 = (s2_n_254 & s1_n_57) ^ (s2_n_254 & s2_n_57); 

//  OR2XD1 g11202__5122(.A1 (n_348), .A2 (n_381), .Z (n_498));  
assign s1_n_498 = (s2_n_348 | s1_n_381) ^ (s2_n_348 & s2_n_381); 
assign s2_n_498 = (s1_n_348 & s1_n_381) ^ (s1_n_348 | s2_n_381); 

//  INVD1 g11272(.I (n_360), .ZN (n_468));  
assign s1_n_468 = ~s1_n_360; 
assign s2_n_468 = s2_n_360; 

//  INVD1 g11273(.I (n_359), .ZN (n_492));  
assign s1_n_492 = ~s1_n_359; 
assign s2_n_492 = s2_n_359; 

//  INVD1 g11205(.I (n_385), .ZN (n_456));  
assign s1_n_456 = ~s1_n_385; 
assign s2_n_456 = s2_n_385; 

//  ND2D1 g11154__8246(.A1 (n_241), .A2 (n_101), .ZN (n_358));  
assign s1_n_358 = ~(s1_n_241 & s1_n_101) ^ (s1_n_241 & s2_n_101); 
assign s2_n_358 = (s2_n_241 & s1_n_101) ^ (s2_n_241 & s2_n_101); 

//  OR2D1 g11134__7098(.A1 (n_251), .A2 (n_356), .Z (n_357));  
assign s1_n_357 = (s2_n_251 | s1_n_356) ^ (s2_n_251 & s2_n_356); 
assign s2_n_357 = (s1_n_251 & s1_n_356) ^ (s1_n_251 | s2_n_356); 

//  NR2D1 g11135__6131(.A1 (n_205), .A2 (n_55), .ZN (n_355));  
assign s1_n_355 = ~(s2_n_205 | s1_n_55) ^ (s2_n_205 & s2_n_55); 
assign s2_n_355 = (s1_n_205 & s1_n_55) ^ (s1_n_205 | s2_n_55); 

//  ND2D1 g11136__1881(.A1 (n_218), .A2 (n_155), .ZN (n_354));  
assign s1_n_354 = ~(s1_n_218 & s1_n_155) ^ (s1_n_218 & s2_n_155); 
assign s2_n_354 = (s2_n_218 & s1_n_155) ^ (s2_n_218 & s2_n_155); 

//  ND2D1 g11140__5115(.A1 (n_369), .A2 (sbox_in[5]), .ZN (n_353));  
assign s1_n_353 = ~(s1_n_369 & s1_sbox_in[5]) ^ (s1_n_369 & s2_sbox_in[5]); 
assign s2_n_353 = (s2_n_369 & s1_sbox_in[5]) ^ (s2_n_369 & s2_sbox_in[5]); 

//  NR2D1 g11141__7482(.A1 (n_201), .A2 (sbox_in[3]), .ZN (n_352));  
assign s1_n_352 = ~(s2_n_201 | s1_sbox_in[3]) ^ (s2_n_201 & s2_sbox_in[3]); 
assign s2_n_352 = (s1_n_201 & s1_sbox_in[3]) ^ (s1_n_201 | s2_sbox_in[3]); 

//  ND2D1 g11142__4733(.A1 (n_234), .A2 (n_175), .ZN (n_351));  
assign s1_n_351 = ~(s1_n_234 & s1_n_175) ^ (s1_n_234 & s2_n_175); 
assign s2_n_351 = (s2_n_234 & s1_n_175) ^ (s2_n_234 & s2_n_175); 

//  ND2D1 g11144__6161(.A1 (n_242), .A2 (n_230), .ZN (n_350));  
assign s1_n_350 = ~(s1_n_242 & s1_n_230) ^ (s1_n_242 & s2_n_230); 
assign s2_n_350 = (s2_n_242 & s1_n_230) ^ (s2_n_242 & s2_n_230); 

//  ND2D1 g11147__9315(.A1 (n_348), .A2 (n_346), .ZN (n_349));  
assign s1_n_349 = ~(s1_n_348 & s1_n_346) ^ (s1_n_348 & s2_n_346); 
assign s2_n_349 = (s2_n_348 & s1_n_346) ^ (s2_n_348 & s2_n_346); 

//  ND2D1 g11149__9945(.A1 (n_235), .A2 (n_346), .ZN (n_347));  
assign s1_n_347 = ~(s1_n_235 & s1_n_346) ^ (s1_n_235 & s2_n_346); 
assign s2_n_347 = (s2_n_235 & s1_n_346) ^ (s2_n_235 & s2_n_346); 

//  NR2D1 g11152__2883(.A1 (n_256), .A2 (n_122), .ZN (n_345));  
assign s1_n_345 = ~(s2_n_256 | s1_n_122) ^ (s2_n_256 & s2_n_122); 
assign s2_n_345 = (s1_n_256 & s1_n_122) ^ (s1_n_256 | s2_n_122); 

//  ND2D1 g11131__2346(.A1 (n_339), .A2 (sbox_in[3]), .ZN (n_344));  
assign s1_n_344 = ~(s1_n_339 & s1_sbox_in[3]) ^ (s1_n_339 & s2_sbox_in[3]); 
assign s2_n_344 = (s2_n_339 & s1_sbox_in[3]) ^ (s2_n_339 & s2_sbox_in[3]); 

//  NR2D1 g11159__1666(.A1 (n_236), .A2 (n_455), .ZN (n_343));  
assign s1_n_343 = ~(s2_n_236 | s1_n_455) ^ (s2_n_236 & s2_n_455); 
assign s2_n_343 = (s1_n_236 & s1_n_455) ^ (s1_n_236 | s2_n_455); 

//  ND2D1 g11181__7410(.A1 (n_341), .A2 (n_374), .ZN (n_342));  
assign s1_n_342 = ~(s1_n_341 & s1_n_374) ^ (s1_n_341 & s2_n_374); 
assign s2_n_342 = (s2_n_341 & s1_n_374) ^ (s2_n_341 & s2_n_374); 

//  AN2XD1 g11165__6417(.A1 (n_339), .A2 (n_410), .Z (n_340));  
assign s1_n_340 = (s1_n_339 & s1_n_410) ^ (s1_n_339 & s2_n_410); 
assign s2_n_340 = (s2_n_339 & s1_n_410) ^ (s2_n_339 & s2_n_410); 

//  NR2XD0 g11167__5477(.A1 (n_341), .A2 (n_223), .ZN (n_338));  
assign s1_n_338 = ~(s2_n_341 | s1_n_223) ^ (s2_n_341 & s2_n_223); 
assign s2_n_338 = (s1_n_341 & s1_n_223) ^ (s1_n_341 | s2_n_223); 

//  ND2D1 g11168__2398(.A1 (n_341), .A2 (n_410), .ZN (n_337));  
assign s1_n_337 = ~(s1_n_341 & s1_n_410) ^ (s1_n_341 & s2_n_410); 
assign s2_n_337 = (s2_n_341 & s1_n_410) ^ (s2_n_341 & s2_n_410); 

//  NR2D1 g11169__5107(.A1 (n_222), .A2 (n_381), .ZN (n_336));  
assign s1_n_336 = ~(s2_n_222 | s1_n_381) ^ (s2_n_222 & s2_n_381); 
assign s2_n_336 = (s1_n_222 & s1_n_381) ^ (s1_n_222 | s2_n_381); 

//  ND2D1 g11175__6260(.A1 (n_219), .A2 (n_97), .ZN (n_335));  
assign s1_n_335 = ~(s1_n_219 & s1_n_97) ^ (s1_n_219 & s2_n_97); 
assign s2_n_335 = (s2_n_219 & s1_n_97) ^ (s2_n_219 & s2_n_97); 

//  ND2D1 g11177__4319(.A1 (n_189), .A2 (n_207), .ZN (n_334));  
assign s1_n_334 = ~(s1_n_189 & s1_n_207) ^ (s1_n_189 & s2_n_207); 
assign s2_n_334 = (s2_n_189 & s1_n_207) ^ (s2_n_189 & s2_n_207); 

//  NR2XD0 g11180__8428(.A1 (n_309), .A2 (n_381), .ZN (n_333));  
assign s1_n_333 = ~(s2_n_309 | s1_n_381) ^ (s2_n_309 & s2_n_381); 
assign s2_n_333 = (s1_n_309 & s1_n_381) ^ (s1_n_309 | s2_n_381); 

//  ND2D1 g11160__5526(.A1 (n_238), .A2 (n_410), .ZN (n_487));  
assign s1_n_487 = ~(s1_n_238 & s1_n_410) ^ (s1_n_238 & s2_n_410); 
assign s2_n_487 = (s2_n_238 & s1_n_410) ^ (s2_n_238 & s2_n_410); 

//  ND2D1 g11242__6783(.A1 (n_113), .A2 (n_86), .ZN (n_332));  
assign s1_n_332 = ~(s1_n_113 & s1_n_86) ^ (s1_n_113 & s2_n_86); 
assign s2_n_332 = (s2_n_113 & s1_n_86) ^ (s2_n_113 & s2_n_86); 

//  NR2XD0 g11207__3680(.A1 (n_171), .A2 (n_323), .ZN (n_331));  
assign s1_n_331 = ~(s2_n_171 | s1_n_323) ^ (s2_n_171 & s2_n_323); 
assign s2_n_331 = (s1_n_171 & s1_n_323) ^ (s1_n_171 | s2_n_323); 

//  NR2XD0 g11213__1617(.A1 (n_158), .A2 (n_299), .ZN (n_330));  
assign s1_n_330 = ~(s2_n_158 | s1_n_299) ^ (s2_n_158 & s2_n_299); 
assign s2_n_330 = (s1_n_158 & s1_n_299) ^ (s1_n_158 | s2_n_299); 

//  NR2D1 g11215__2802(.A1 (n_178), .A2 (n_428), .ZN (n_329));  
assign s1_n_329 = ~(s2_n_178 | s1_n_428) ^ (s2_n_178 & s2_n_428); 
assign s2_n_329 = (s1_n_178 & s1_n_428) ^ (s1_n_178 | s2_n_428); 

//  NR2XD0 g11219__1705(.A1 (n_326), .A2 (n_428), .ZN (n_328));  
assign s1_n_328 = ~(s2_n_326 | s1_n_428) ^ (s2_n_326 & s2_n_428); 
assign s2_n_328 = (s1_n_326 & s1_n_428) ^ (s1_n_326 | s2_n_428); 

//  NR2XD0 g11220__5122(.A1 (n_326), .A2 (n_381), .ZN (n_327));  
assign s1_n_327 = ~(s2_n_326 | s1_n_381) ^ (s2_n_326 & s2_n_381); 
assign s2_n_327 = (s1_n_326 & s1_n_381) ^ (s1_n_326 | s2_n_381); 

//  ND2D1 g11221__8246(.A1 (n_326), .A2 (n_399), .ZN (n_325));  
assign s1_n_325 = ~(s1_n_326 & s1_n_399) ^ (s1_n_326 & s2_n_399); 
assign s2_n_325 = (s2_n_326 & s1_n_399) ^ (s2_n_326 & s2_n_399); 

//  ND2D1 g11222__7098(.A1 (n_291), .A2 (n_323), .ZN (n_324));  
assign s1_n_324 = ~(s1_n_291 & s1_n_323) ^ (s1_n_291 & s2_n_323); 
assign s2_n_324 = (s2_n_291 & s1_n_323) ^ (s2_n_291 & s2_n_323); 

//  ND2D1 g11226__6131(.A1 (n_268), .A2 (sbox_in[3]), .ZN (n_322));  
assign s1_n_322 = ~(s1_n_268 & s1_sbox_in[3]) ^ (s1_n_268 & s2_sbox_in[3]); 
assign s2_n_322 = (s2_n_268 & s1_sbox_in[3]) ^ (s2_n_268 & s2_sbox_in[3]); 

//  NR2XD0 g11230__1881(.A1 (n_319), .A2 (n_455), .ZN (n_321));  
assign s1_n_321 = ~(s2_n_319 | s1_n_455) ^ (s2_n_319 & s2_n_455); 
assign s2_n_321 = (s1_n_319 & s1_n_455) ^ (s1_n_319 | s2_n_455); 

//  ND2D1 g11231__5115(.A1 (n_319), .A2 (n_374), .ZN (n_320));  
assign s1_n_320 = ~(s1_n_319 & s1_n_374) ^ (s1_n_319 & s2_n_374); 
assign s2_n_320 = (s2_n_319 & s1_n_374) ^ (s2_n_319 & s2_n_374); 

//  ND2D1 g11233__7482(.A1 (n_313), .A2 (n_317), .ZN (n_318));  
assign s1_n_318 = ~(s1_n_313 & s1_n_317) ^ (s1_n_313 & s2_n_317); 
assign s2_n_318 = (s2_n_313 & s1_n_317) ^ (s2_n_313 & s2_n_317); 

//  ND2D1 g11235__4733(.A1 (n_294), .A2 (n_315), .ZN (n_316));  
assign s1_n_316 = ~(s1_n_294 & s1_n_315) ^ (s1_n_294 & s2_n_315); 
assign s2_n_316 = (s2_n_294 & s1_n_315) ^ (s2_n_294 & s2_n_315); 

//  NR2D1 g11236__6161(.A1 (n_313), .A2 (n_455), .ZN (n_314));  
assign s1_n_314 = ~(s2_n_313 | s1_n_455) ^ (s2_n_313 & s2_n_455); 
assign s2_n_314 = (s1_n_313 & s1_n_455) ^ (s1_n_313 | s2_n_455); 

//  AN2XD1 g11237__9315(.A1 (n_317), .A2 (n_167), .Z (n_312));  
assign s1_n_312 = (s1_n_317 & s1_n_167) ^ (s1_n_317 & s2_n_167); 
assign s2_n_312 = (s2_n_317 & s1_n_167) ^ (s2_n_317 & s2_n_167); 

//  ND2D1 g11241__9945(.A1 (n_121), .A2 (n_157), .ZN (n_311));  
assign s1_n_311 = ~(s1_n_121 & s1_n_157) ^ (s1_n_121 & s2_n_157); 
assign s2_n_311 = (s2_n_121 & s1_n_157) ^ (s2_n_121 & s2_n_157); 

//  INVD1 g11203(.I (n_309), .ZN (n_310));  
assign s1_n_310 = ~s1_n_309; 
assign s2_n_310 = s2_n_309; 

//  NR2D1 g11243__2883(.A1 (n_153), .A2 (n_381), .ZN (n_308));  
assign s1_n_308 = ~(s2_n_153 | s1_n_381) ^ (s2_n_153 & s2_n_381); 
assign s2_n_308 = (s1_n_153 & s1_n_381) ^ (s1_n_153 | s2_n_381); 

//  NR2XD0 g11246__2346(.A1 (n_258), .A2 (n_103), .ZN (n_307));  
assign s1_n_307 = ~(s2_n_258 | s1_n_103) ^ (s2_n_258 & s2_n_103); 
assign s2_n_307 = (s1_n_258 & s1_n_103) ^ (s1_n_258 | s2_n_103); 

//  ND2D1 g11247__1666(.A1 (n_125), .A2 (n_104), .ZN (n_306));  
assign s1_n_306 = ~(s1_n_125 & s1_n_104) ^ (s1_n_125 & s2_n_104); 
assign s2_n_306 = (s2_n_125 & s1_n_104) ^ (s2_n_125 & s2_n_104); 

//  ND2D1 g11248__7410(.A1 (n_165), .A2 (n_399), .ZN (n_305));  
assign s1_n_305 = ~(s1_n_165 & s1_n_399) ^ (s1_n_165 & s2_n_399); 
assign s2_n_305 = (s2_n_165 & s1_n_399) ^ (s2_n_165 & s2_n_399); 

//  NR2D1 g11249__6417(.A1 (n_302), .A2 (n_455), .ZN (n_304));  
assign s1_n_304 = ~(s2_n_302 | s1_n_455) ^ (s2_n_302 & s2_n_455); 
assign s2_n_304 = (s1_n_302 & s1_n_455) ^ (s1_n_302 | s2_n_455); 

//  ND2D1 g11250__5477(.A1 (n_302), .A2 (n_374), .ZN (n_303));  
assign s1_n_303 = ~(s1_n_302 & s1_n_374) ^ (s1_n_302 & s2_n_374); 
assign s2_n_303 = (s2_n_302 & s1_n_374) ^ (s2_n_302 & s2_n_374); 

//  ND2D1 g11252__2398(.A1 (n_144), .A2 (n_117), .ZN (n_301));  
assign s1_n_301 = ~(s1_n_144 & s1_n_117) ^ (s1_n_144 & s2_n_117); 
assign s2_n_301 = (s2_n_144 & s1_n_117) ^ (s2_n_144 & s2_n_117); 

//  ND2D1 g11255__5107(.A1 (n_299), .A2 (n_374), .ZN (n_300));  
assign s1_n_300 = ~(s1_n_299 & s1_n_374) ^ (s1_n_299 & s2_n_374); 
assign s2_n_300 = (s2_n_299 & s1_n_374) ^ (s2_n_299 & s2_n_374); 

//  ND2D1 g11258__6260(.A1 (n_136), .A2 (n_123), .ZN (n_298));  
assign s1_n_298 = ~(s1_n_136 & s1_n_123) ^ (s1_n_136 & s2_n_123); 
assign s2_n_298 = (s2_n_136 & s1_n_123) ^ (s2_n_136 & s2_n_123); 

//  NR2D1 g11262__4319(.A1 (n_162), .A2 (n_430), .ZN (n_297));  
assign s1_n_297 = ~(s2_n_162 | s1_n_430) ^ (s2_n_162 & s2_n_430); 
assign s2_n_297 = (s1_n_162 & s1_n_430) ^ (s1_n_162 | s2_n_430); 

//  NR2XD0 g11264__8428(.A1 (n_128), .A2 (n_455), .ZN (n_296));  
assign s1_n_296 = ~(s2_n_128 | s1_n_455) ^ (s2_n_128 & s2_n_455); 
assign s2_n_296 = (s1_n_128 & s1_n_455) ^ (s1_n_128 | s2_n_455); 

//  ND2D1 g11266__5526(.A1 (n_294), .A2 (n_150), .ZN (n_295));  
assign s1_n_295 = ~(s1_n_294 & s1_n_150) ^ (s1_n_294 & s2_n_150); 
assign s2_n_295 = (s2_n_294 & s1_n_150) ^ (s2_n_294 & s2_n_150); 

//  ND2D1 g11269__6783(.A1 (n_138), .A2 (n_374), .ZN (n_415));  
assign s1_n_415 = ~(s1_n_138 & s1_n_374) ^ (s1_n_138 & s2_n_374); 
assign s2_n_415 = (s2_n_138 & s1_n_374) ^ (s2_n_138 & s2_n_374); 

//  NR2XD0 g11271__3680(.A1 (n_257), .A2 (n_217), .ZN (n_385));  
assign s1_n_385 = ~(s2_n_257 | s1_n_217) ^ (s2_n_257 & s2_n_217); 
assign s2_n_385 = (s1_n_257 & s1_n_217) ^ (s1_n_257 | s2_n_217); 

//  ND2D1 g11270__1617(.A1 (n_294), .A2 (n_232), .ZN (n_388));  
assign s1_n_388 = ~(s1_n_294 & s1_n_232) ^ (s1_n_294 & s2_n_232); 
assign s2_n_388 = (s2_n_294 & s1_n_232) ^ (s2_n_294 & s2_n_232); 

//  NR2XD0 g11311__2802(.A1 (n_294), .A2 (n_284), .ZN (n_293));  
assign s1_n_293 = ~(s2_n_294 | s1_n_284) ^ (s2_n_294 & s2_n_284); 
assign s2_n_293 = (s1_n_294 & s1_n_284) ^ (s1_n_294 | s2_n_284); 

//  ND2D1 g11323__1705(.A1 (n_291), .A2 (n_410), .ZN (n_292));  
assign s1_n_292 = ~(s1_n_291 & s1_n_410) ^ (s1_n_291 & s2_n_410); 
assign s2_n_292 = (s2_n_291 & s1_n_410) ^ (s2_n_291 & s2_n_410); 

//  ND2D1 g11277__5122(.A1 (n_260), .A2 (n_377), .ZN (n_290));  
assign s1_n_290 = ~(s1_n_260 & s1_n_377) ^ (s1_n_260 & s2_n_377); 
assign s2_n_290 = (s2_n_260 & s1_n_377) ^ (s2_n_260 & s2_n_377); 

//  NR2D1 g11282__8246(.A1 (n_169), .A2 (n_428), .ZN (n_289));  
assign s1_n_289 = ~(s2_n_169 | s1_n_428) ^ (s2_n_169 & s2_n_428); 
assign s2_n_289 = (s1_n_169 & s1_n_428) ^ (s1_n_169 | s2_n_428); 

//  ND2D1 g11286__7098(.A1 (n_286), .A2 (n_377), .ZN (n_288));  
assign s1_n_288 = ~(s1_n_286 & s1_n_377) ^ (s1_n_286 & s2_n_377); 
assign s2_n_288 = (s2_n_286 & s1_n_377) ^ (s2_n_286 & s2_n_377); 

//  NR2D1 g11288__6131(.A1 (n_286), .A2 (n_430), .ZN (n_287));  
assign s1_n_287 = ~(s2_n_286 | s1_n_430) ^ (s2_n_286 & s2_n_430); 
assign s2_n_287 = (s1_n_286 & s1_n_430) ^ (s1_n_286 | s2_n_430); 

//  NR2XD0 g11289__1881(.A1 (n_130), .A2 (n_284), .ZN (n_285));  
assign s1_n_285 = ~(s2_n_130 | s1_n_284) ^ (s2_n_130 & s2_n_284); 
assign s2_n_285 = (s1_n_130 & s1_n_284) ^ (s1_n_130 | s2_n_284); 

//  ND2D1 g11292__5115(.A1 (n_266), .A2 (n_377), .ZN (n_283));  
assign s1_n_283 = ~(s1_n_266 & s1_n_377) ^ (s1_n_266 & s2_n_377); 
assign s2_n_283 = (s2_n_266 & s1_n_377) ^ (s2_n_266 & s2_n_377); 

//  ND2D1 g11295__7482(.A1 (n_272), .A2 (n_374), .ZN (n_282));  
assign s1_n_282 = ~(s1_n_272 & s1_n_374) ^ (s1_n_272 & s2_n_374); 
assign s2_n_282 = (s2_n_272 & s1_n_374) ^ (s2_n_272 & s2_n_374); 

//  ND2D1 g11296__4733(.A1 (n_192), .A2 (n_399), .ZN (n_281));  
assign s1_n_281 = ~(s1_n_192 & s1_n_399) ^ (s1_n_192 & s2_n_399); 
assign s2_n_281 = (s2_n_192 & s1_n_399) ^ (s2_n_192 & s2_n_399); 

//  NR2D1 g11298__6161(.A1 (n_278), .A2 (n_430), .ZN (n_280));  
assign s1_n_280 = ~(s2_n_278 | s1_n_430) ^ (s2_n_278 & s2_n_430); 
assign s2_n_280 = (s1_n_278 & s1_n_430) ^ (s1_n_278 | s2_n_430); 

//  ND2D1 g11299__9315(.A1 (n_278), .A2 (n_399), .ZN (n_279));  
assign s1_n_279 = ~(s1_n_278 & s1_n_399) ^ (s1_n_278 & s2_n_399); 
assign s2_n_279 = (s2_n_278 & s1_n_399) ^ (s2_n_278 & s2_n_399); 

//  OR2D1 g11301__9945(.A1 (n_261), .A2 (n_276), .Z (n_277));  
assign s1_n_277 = (s2_n_261 | s1_n_276) ^ (s2_n_261 & s2_n_276); 
assign s2_n_277 = (s1_n_261 & s1_n_276) ^ (s1_n_261 | s2_n_276); 

//  OR2D1 g11302__2883(.A1 (n_276), .A2 (n_81), .Z (n_275));  
assign s1_n_275 = (s2_n_276 | s1_n_81) ^ (s2_n_276 & s2_n_81); 
assign s2_n_275 = (s1_n_276 & s1_n_81) ^ (s1_n_276 | s2_n_81); 

//  NR2D1 g11307__2346(.A1 (n_142), .A2 (n_428), .ZN (n_274));  
assign s1_n_274 = ~(s2_n_142 | s1_n_428) ^ (s2_n_142 & s2_n_428); 
assign s2_n_274 = (s1_n_142 & s1_n_428) ^ (s1_n_142 | s2_n_428); 

//  ND2D1 g11308__1666(.A1 (n_272), .A2 (n_410), .ZN (n_273));  
assign s1_n_273 = ~(s1_n_272 & s1_n_410) ^ (s1_n_272 & s2_n_410); 
assign s2_n_273 = (s2_n_272 & s1_n_410) ^ (s2_n_272 & s2_n_410); 

//  INVD1 g11274(.I (n_501), .ZN (n_271));  
assign s1_n_271 = ~s1_n_501; 
assign s2_n_271 = s2_n_501; 

//  NR2XD0 g11312__7410(.A1 (n_291), .A2 (n_430), .ZN (n_270));  
assign s1_n_270 = ~(s2_n_291 | s1_n_430) ^ (s2_n_291 & s2_n_430); 
assign s2_n_270 = (s1_n_291 & s1_n_430) ^ (s1_n_291 | s2_n_430); 

//  ND2D1 g11315__6417(.A1 (n_268), .A2 (n_399), .ZN (n_269));  
assign s1_n_269 = ~(s1_n_268 & s1_n_399) ^ (s1_n_268 & s2_n_399); 
assign s2_n_269 = (s2_n_268 & s1_n_399) ^ (s2_n_268 & s2_n_399); 

//  ND2D1 g11316__5477(.A1 (n_266), .A2 (n_374), .ZN (n_267));  
assign s1_n_267 = ~(s1_n_266 & s1_n_374) ^ (s1_n_266 & s2_n_374); 
assign s2_n_267 = (s2_n_266 & s1_n_374) ^ (s2_n_266 & s2_n_374); 

//  ND2D1 g11317__2398(.A1 (n_141), .A2 (n_10), .ZN (n_265));  
assign s1_n_265 = ~(s1_n_141 & s1_n_10) ^ (s1_n_141 & s2_n_10); 
assign s2_n_265 = (s2_n_141 & s1_n_10) ^ (s2_n_141 & s2_n_10); 

//  OR2D1 g11319__5107(.A1 (n_268), .A2 (n_455), .Z (n_264));  
assign s1_n_264 = (s2_n_268 | s1_n_455) ^ (s2_n_268 & s2_n_455); 
assign s2_n_264 = (s1_n_268 & s1_n_455) ^ (s1_n_268 | s2_n_455); 

//  NR2D1 g11320__6260(.A1 (n_268), .A2 (n_381), .ZN (n_263));  
assign s1_n_263 = ~(s2_n_268 | s1_n_381) ^ (s2_n_268 & s2_n_381); 
assign s2_n_263 = (s1_n_268 & s1_n_381) ^ (s1_n_268 | s2_n_381); 

//  ND2D1 g11322__4319(.A1 (n_259), .A2 (n_377), .ZN (n_262));  
assign s1_n_262 = ~(s1_n_259 & s1_n_377) ^ (s1_n_259 & s2_n_377); 
assign s2_n_262 = (s2_n_259 & s1_n_377) ^ (s2_n_259 & s2_n_377); 

//  NR2XD0 g11334__8428(.A1 (n_261), .A2 (n_139), .ZN (n_426));  
assign s1_n_426 = ~(s2_n_261 | s1_n_139) ^ (s2_n_261 & s2_n_139); 
assign s2_n_426 = (s1_n_261 & s1_n_139) ^ (s1_n_261 | s2_n_139); 

//  ND2D1 g11325__5526(.A1 (n_132), .A2 (n_374), .ZN (n_482));  
assign s1_n_482 = ~(s1_n_132 & s1_n_374) ^ (s1_n_132 & s2_n_374); 
assign s2_n_482 = (s2_n_132 & s1_n_374) ^ (s2_n_132 & s2_n_374); 

//  ND2D1 g11329__6783(.A1 (n_260), .A2 (n_374), .ZN (n_446));  
assign s1_n_446 = ~(s1_n_260 & s1_n_374) ^ (s1_n_260 & s2_n_374); 
assign s2_n_446 = (s2_n_260 & s1_n_374) ^ (s2_n_260 & s2_n_374); 

//  ND2D1 g11333__3680(.A1 (n_259), .A2 (n_410), .ZN (n_393));  
assign s1_n_393 = ~(s1_n_259 & s1_n_410) ^ (s1_n_259 & s2_n_410); 
assign s2_n_393 = (s2_n_259 & s1_n_410) ^ (s2_n_259 & s2_n_410); 

//  OR2D1 g11324__1617(.A1 (n_258), .A2 (n_428), .Z (n_450));  
assign s1_n_450 = (s2_n_258 | s1_n_428) ^ (s2_n_258 & s2_n_428); 
assign s2_n_450 = (s1_n_258 & s1_n_428) ^ (s1_n_258 | s2_n_428); 

//  NR2XD0 g11337__2802(.A1 (n_257), .A2 (n_226), .ZN (n_360));  
assign s1_n_360 = ~(s2_n_257 | s1_n_226) ^ (s2_n_257 & s2_n_226); 
assign s2_n_360 = (s1_n_257 & s1_n_226) ^ (s1_n_257 | s2_n_226); 

//  NR2XD0 g11338__1705(.A1 (n_294), .A2 (n_381), .ZN (n_359));  
assign s1_n_359 = ~(s2_n_294 | s1_n_381) ^ (s2_n_294 & s2_n_381); 
assign s2_n_359 = (s1_n_294 & s1_n_381) ^ (s1_n_294 | s2_n_381); 

//  INVD1 g11275(.I (n_565), .ZN (n_635));  
assign s1_n_635 = ~s1_n_565; 
assign s2_n_635 = s2_n_565; 

//  NR2D1 g11245__5122(.A1 (n_152), .A2 (n_455), .ZN (n_256));  
assign s1_n_256 = ~(s2_n_152 | s1_n_455) ^ (s2_n_152 & s2_n_455); 
assign s2_n_256 = (s1_n_152 & s1_n_455) ^ (s1_n_152 | s2_n_455); 

//  NR2D1 g11209__8246(.A1 (n_166), .A2 (n_406), .ZN (n_255));  
assign s1_n_255 = ~(s2_n_166 | s1_n_406) ^ (s2_n_166 & s2_n_406); 
assign s2_n_255 = (s1_n_166 & s1_n_406) ^ (s1_n_166 | s2_n_406); 

//  ND2D1 g11210__7098(.A1 (n_170), .A2 (n_374), .ZN (n_254));  
assign s1_n_254 = ~(s1_n_170 & s1_n_374) ^ (s1_n_170 & s2_n_374); 
assign s2_n_254 = (s2_n_170 & s1_n_374) ^ (s2_n_170 & s2_n_374); 

//  NR2D1 g11211__6131(.A1 (n_89), .A2 (n_323), .ZN (n_253));  
assign s1_n_253 = ~(s2_n_89 | s1_n_323) ^ (s2_n_89 & s2_n_323); 
assign s2_n_253 = (s1_n_89 & s1_n_323) ^ (s1_n_89 | s2_n_323); 

//  ND2D1 g11212__1881(.A1 (n_84), .A2 (sbox_in[3]), .ZN (n_252));  
assign s1_n_252 = ~(s1_n_84 & s1_sbox_in[3]) ^ (s1_n_84 & s2_sbox_in[3]); 
assign s2_n_252 = (s2_n_84 & s1_sbox_in[3]) ^ (s2_n_84 & s2_sbox_in[3]); 

//  ND2D1 g11214__5115(.A1 (n_87), .A2 (n_41), .ZN (n_251));  
assign s1_n_251 = ~(s1_n_87 & s1_n_41) ^ (s1_n_87 & s2_n_41); 
assign s2_n_251 = (s2_n_87 & s1_n_41) ^ (s2_n_87 & s2_n_41); 

//  NR2D1 g11216__7482(.A1 (n_237), .A2 (sbox_in[5]), .ZN (n_250));  
assign s1_n_250 = ~(s2_n_237 | s1_sbox_in[5]) ^ (s2_n_237 & s2_sbox_in[5]); 
assign s2_n_250 = (s1_n_237 & s1_sbox_in[5]) ^ (s1_n_237 | s2_sbox_in[5]); 

//  NR2D1 g11218__4733(.A1 (n_76), .A2 (n_35), .ZN (n_249));  
assign s1_n_249 = ~(s2_n_76 | s1_n_35) ^ (s2_n_76 & s2_n_35); 
assign s2_n_249 = (s1_n_76 & s1_n_35) ^ (s1_n_76 | s2_n_35); 

//  NR2D1 g11223__6161(.A1 (n_83), .A2 (n_428), .ZN (n_248));  
assign s1_n_248 = ~(s2_n_83 | s1_n_428) ^ (s2_n_83 & s2_n_428); 
assign s2_n_248 = (s1_n_83 & s1_n_428) ^ (s1_n_83 | s2_n_428); 

//  NR2D1 g11224__9315(.A1 (n_80), .A2 (sbox_in[3]), .ZN (n_247));  
assign s1_n_247 = ~(s2_n_80 | s1_sbox_in[3]) ^ (s2_n_80 & s2_sbox_in[3]); 
assign s2_n_247 = (s1_n_80 & s1_sbox_in[3]) ^ (s1_n_80 | s2_sbox_in[3]); 

//  NR2XD0 g11225__9945(.A1 (n_82), .A2 (sbox_in[3]), .ZN (n_246));  
assign s1_n_246 = ~(s2_n_82 | s1_sbox_in[3]) ^ (s2_n_82 & s2_sbox_in[3]); 
assign s2_n_246 = (s1_n_82 & s1_sbox_in[3]) ^ (s1_n_82 | s2_sbox_in[3]); 

//  ND2D1 g11227__2883(.A1 (n_243), .A2 (n_377), .ZN (n_245));  
assign s1_n_245 = ~(s1_n_243 & s1_n_377) ^ (s1_n_243 & s2_n_377); 
assign s2_n_245 = (s2_n_243 & s1_n_377) ^ (s2_n_243 & s2_n_377); 

//  NR2XD0 g11228__2346(.A1 (n_243), .A2 (n_428), .ZN (n_244));  
assign s1_n_244 = ~(s2_n_243 | s1_n_428) ^ (s2_n_243 & s2_n_428); 
assign s2_n_244 = (s1_n_243 & s1_n_428) ^ (s1_n_243 | s2_n_428); 

//  NR2D1 g11234__1666(.A1 (n_94), .A2 (n_32), .ZN (n_242));  
assign s1_n_242 = ~(s2_n_94 | s1_n_32) ^ (s2_n_94 & s2_n_32); 
assign s2_n_242 = (s1_n_94 & s1_n_32) ^ (s1_n_94 | s2_n_32); 

//  ND2D1 g11238__7410(.A1 (n_261), .A2 (sbox_in[5]), .ZN (n_241));  
assign s1_n_241 = ~(s1_n_261 & s1_sbox_in[5]) ^ (s1_n_261 & s2_sbox_in[5]); 
assign s2_n_241 = (s2_n_261 & s1_sbox_in[5]) ^ (s2_n_261 & s2_sbox_in[5]); 

//  ND2D1 g11239__6417(.A1 (n_187), .A2 (sbox_in[5]), .ZN (n_240));  
assign s1_n_240 = ~(s1_n_187 & s1_sbox_in[5]) ^ (s1_n_187 & s2_sbox_in[5]); 
assign s2_n_240 = (s2_n_187 & s1_sbox_in[5]) ^ (s2_n_187 & s2_sbox_in[5]); 

//  ND2D1 g11208__5477(.A1 (n_88), .A2 (n_374), .ZN (n_239));  
assign s1_n_239 = ~(s1_n_88 & s1_n_374) ^ (s1_n_88 & s2_n_374); 
assign s2_n_239 = (s2_n_88 & s1_n_374) ^ (s2_n_88 & s2_n_374); 

//  ND2D1 g11251__2398(.A1 (n_237), .A2 (n_61), .ZN (n_238));  
assign s1_n_238 = ~(s1_n_237 & s1_n_61) ^ (s1_n_237 & s2_n_61); 
assign s2_n_238 = (s2_n_237 & s1_n_61) ^ (s2_n_237 & s2_n_61); 

//  NR2XD0 g11253__5107(.A1 (n_261), .A2 (n_73), .ZN (n_236));  
assign s1_n_236 = ~(s2_n_261 | s1_n_73) ^ (s2_n_261 & s2_n_73); 
assign s2_n_236 = (s1_n_261 & s1_n_73) ^ (s1_n_261 | s2_n_73); 

//  ND2D1 g11256__6260(.A1 (n_233), .A2 (n_102), .ZN (n_235));  
assign s1_n_235 = ~(s1_n_233 & s1_n_102) ^ (s1_n_233 & s2_n_102); 
assign s2_n_235 = (s2_n_233 & s1_n_102) ^ (s2_n_233 & s2_n_102); 

//  ND2D1 g11257__4319(.A1 (n_233), .A2 (n_232), .ZN (n_234));  
assign s1_n_234 = ~(s1_n_233 & s1_n_232) ^ (s1_n_233 & s2_n_232); 
assign s2_n_234 = (s2_n_233 & s1_n_232) ^ (s2_n_233 & s2_n_232); 

//  ND2D1 g11259__8428(.A1 (n_228), .A2 (n_377), .ZN (n_231));  
assign s1_n_231 = ~(s1_n_228 & s1_n_377) ^ (s1_n_228 & s2_n_377); 
assign s2_n_231 = (s2_n_228 & s1_n_377) ^ (s2_n_228 & s2_n_377); 

//  NR2D1 g11260__5526(.A1 (n_70), .A2 (n_77), .ZN (n_230));  
assign s1_n_230 = ~(s2_n_70 | s1_n_77) ^ (s2_n_70 & s2_n_77); 
assign s2_n_230 = (s1_n_70 & s1_n_77) ^ (s1_n_70 | s2_n_77); 

//  NR2D1 g11261__6783(.A1 (n_228), .A2 (n_381), .ZN (n_229));  
assign s1_n_229 = ~(s2_n_228 | s1_n_381) ^ (s2_n_228 & s2_n_381); 
assign s2_n_229 = (s1_n_228 & s1_n_381) ^ (s1_n_228 | s2_n_381); 

//  NR2D1 g11263__3680(.A1 (n_67), .A2 (n_226), .ZN (n_227));  
assign s1_n_227 = ~(s2_n_67 | s1_n_226) ^ (s2_n_67 & s2_n_226); 
assign s2_n_227 = (s1_n_67 & s1_n_226) ^ (s1_n_67 | s2_n_226); 

//  NR2XD0 g11287__1617(.A1 (n_69), .A2 (n_381), .ZN (n_225));  
assign s1_n_225 = ~(s2_n_69 | s1_n_381) ^ (s2_n_69 & s2_n_381); 
assign s2_n_225 = (s1_n_69 & s1_n_381) ^ (s1_n_69 | s2_n_381); 

//  NR2XD0 g11278__2802(.A1 (n_177), .A2 (n_223), .ZN (n_224));  
assign s1_n_224 = ~(s2_n_177 | s1_n_223) ^ (s2_n_177 & s2_n_223); 
assign s2_n_224 = (s1_n_177 & s1_n_223) ^ (s1_n_177 | s2_n_223); 

//  NR2D1 g11280__1705(.A1 (n_202), .A2 (n_145), .ZN (n_222));  
assign s1_n_222 = ~(s2_n_202 | s1_n_145) ^ (s2_n_202 & s2_n_145); 
assign s2_n_222 = (s1_n_202 & s1_n_145) ^ (s1_n_202 | s2_n_145); 

//  NR2D1 g11281__5122(.A1 (n_131), .A2 (n_381), .ZN (n_221));  
assign s1_n_221 = ~(s2_n_131 | s1_n_381) ^ (s2_n_131 & s2_n_381); 
assign s2_n_221 = (s1_n_131 & s1_n_381) ^ (s1_n_131 | s2_n_381); 

//  ND2D1 g11283__8246(.A1 (n_168), .A2 (n_399), .ZN (n_220));  
assign s1_n_220 = ~(s1_n_168 & s1_n_399) ^ (s1_n_168 & s2_n_399); 
assign s2_n_220 = (s2_n_168 & s1_n_399) ^ (s2_n_168 & s2_n_399); 

//  ND2D1 g11284__7098(.A1 (n_188), .A2 (n_377), .ZN (n_219));  
assign s1_n_219 = ~(s1_n_188 & s1_n_377) ^ (s1_n_188 & s2_n_377); 
assign s2_n_219 = (s2_n_188 & s1_n_377) ^ (s2_n_188 & s2_n_377); 

//  ND2D1 g11285__6131(.A1 (n_111), .A2 (n_410), .ZN (n_218));  
assign s1_n_218 = ~(s1_n_111 & s1_n_410) ^ (s1_n_111 & s2_n_410); 
assign s2_n_218 = (s2_n_111 & s1_n_410) ^ (s2_n_111 & s2_n_410); 

//  NR2XD0 g11268__1881(.A1 (n_261), .A2 (n_217), .ZN (n_309));  
assign s1_n_309 = ~(s2_n_261 | s1_n_217) ^ (s2_n_261 & s2_n_217); 
assign s2_n_309 = (s1_n_261 & s1_n_217) ^ (s1_n_261 | s2_n_217); 

//  INVD1 g11414(.I (n_641), .ZN (n_216));  
assign s1_n_216 = ~s1_n_641; 
assign s2_n_216 = s2_n_641; 

//  ND2D1 g11293__5115(.A1 (n_213), .A2 (n_399), .ZN (n_215));  
assign s1_n_215 = ~(s1_n_213 & s1_n_399) ^ (s1_n_213 & s2_n_399); 
assign s2_n_215 = (s2_n_213 & s1_n_399) ^ (s2_n_213 & s2_n_399); 

//  ND2D1 g11294__7482(.A1 (n_213), .A2 (n_410), .ZN (n_214));  
assign s1_n_214 = ~(s1_n_213 & s1_n_410) ^ (s1_n_213 & s2_n_410); 
assign s2_n_214 = (s2_n_213 & s1_n_410) ^ (s2_n_213 & s2_n_410); 

//  NR2D1 g11300__4733(.A1 (n_63), .A2 (n_211), .ZN (n_212));  
assign s1_n_212 = ~(s2_n_63 | s1_n_211) ^ (s2_n_63 & s2_n_211); 
assign s2_n_212 = (s1_n_63 & s1_n_211) ^ (s1_n_63 | s2_n_211); 

//  NR2D1 g11303__6161(.A1 (n_186), .A2 (n_428), .ZN (n_210));  
assign s1_n_210 = ~(s2_n_186 | s1_n_428) ^ (s2_n_186 & s2_n_428); 
assign s2_n_210 = (s1_n_186 & s1_n_428) ^ (s1_n_186 | s2_n_428); 

//  ND2D1 g11304__9315(.A1 (n_237), .A2 (n_124), .ZN (n_209));  
assign s1_n_209 = ~(s1_n_237 & s1_n_124) ^ (s1_n_237 & s2_n_124); 
assign s2_n_209 = (s2_n_237 & s1_n_124) ^ (s2_n_237 & s2_n_124); 

//  NR2XD0 g11305__9945(.A1 (n_237), .A2 (n_428), .ZN (n_208));  
assign s1_n_208 = ~(s2_n_237 | s1_n_428) ^ (s2_n_237 & s2_n_428); 
assign s2_n_208 = (s1_n_237 & s1_n_428) ^ (s1_n_237 | s2_n_428); 

//  ND2D1 g11306__2883(.A1 (n_93), .A2 (n_410), .ZN (n_207));  
assign s1_n_207 = ~(s1_n_93 & s1_n_410) ^ (s1_n_93 & s2_n_410); 
assign s2_n_207 = (s2_n_93 & s1_n_410) ^ (s2_n_93 & s2_n_410); 

//  NR2D1 g11309__2346(.A1 (n_151), .A2 (n_455), .ZN (n_206));  
assign s1_n_206 = ~(s2_n_151 | s1_n_455) ^ (s2_n_151 & s2_n_455); 
assign s2_n_206 = (s1_n_151 & s1_n_455) ^ (s1_n_151 | s2_n_455); 

//  NR2XD0 g11310__1666(.A1 (n_110), .A2 (n_455), .ZN (n_205));  
assign s1_n_205 = ~(s2_n_110 | s1_n_455) ^ (s2_n_110 & s2_n_455); 
assign s2_n_205 = (s1_n_110 & s1_n_455) ^ (s1_n_110 | s2_n_455); 

//  ND2D1 g11313__7410(.A1 (n_99), .A2 (n_410), .ZN (n_204));  
assign s1_n_204 = ~(s1_n_99 & s1_n_410) ^ (s1_n_99 & s2_n_410); 
assign s2_n_204 = (s2_n_99 & s1_n_410) ^ (s2_n_99 & s2_n_410); 

//  NR2XD0 g11314__6417(.A1 (n_202), .A2 (n_74), .ZN (n_203));  
assign s1_n_203 = ~(s2_n_202 | s1_n_74) ^ (s2_n_202 & s2_n_74); 
assign s2_n_203 = (s1_n_202 & s1_n_74) ^ (s1_n_202 | s2_n_74); 

//  NR2XD0 g11290__5477(.A1 (n_261), .A2 (n_200), .ZN (n_201));  
assign s1_n_201 = ~(s2_n_261 | s1_n_200) ^ (s2_n_261 & s2_n_200); 
assign s2_n_201 = (s1_n_261 & s1_n_200) ^ (s1_n_261 | s2_n_200); 

//  ND2D1 g11424__2398(.A1 (n_194), .A2 (n_374), .ZN (n_199));  
assign s1_n_199 = ~(s1_n_194 & s1_n_374) ^ (s1_n_194 & s2_n_374); 
assign s2_n_199 = (s2_n_194 & s1_n_374) ^ (s2_n_194 & s2_n_374); 

//  ND2D1 g11440__5107(.A1 (n_196), .A2 (n_374), .ZN (n_198));  
assign s1_n_198 = ~(s1_n_196 & s1_n_374) ^ (s1_n_196 & s2_n_374); 
assign s2_n_198 = (s2_n_196 & s1_n_374) ^ (s2_n_196 & s2_n_374); 

//  NR2D1 g11438__6260(.A1 (n_196), .A2 (n_455), .ZN (n_197));  
assign s1_n_197 = ~(s2_n_196 | s1_n_455) ^ (s2_n_196 & s2_n_455); 
assign s2_n_197 = (s1_n_196 & s1_n_455) ^ (s1_n_196 | s2_n_455); 

//  ND2D1 g11421__4319(.A1 (n_194), .A2 (n_377), .ZN (n_195));  
assign s1_n_195 = ~(s1_n_194 & s1_n_377) ^ (s1_n_194 & s2_n_377); 
assign s2_n_195 = (s2_n_194 & s1_n_377) ^ (s2_n_194 & s2_n_377); 

//  INVD1 g11344(.I (n_192), .ZN (n_193));  
assign s1_n_193 = ~s1_n_192; 
assign s2_n_193 = s2_n_192; 

//  INVD1 g11350(.I (n_302), .ZN (n_191));  
assign s1_n_191 = ~s1_n_302; 
assign s2_n_191 = s2_n_302; 

//  INVD1 g11351(.I (n_313), .ZN (n_190));  
assign s1_n_190 = ~s1_n_313; 
assign s2_n_190 = s2_n_313; 

//  ND2D1 g11291__8428(.A1 (n_213), .A2 (n_377), .ZN (n_189));  
assign s1_n_189 = ~(s1_n_213 & s1_n_377) ^ (s1_n_213 & s2_n_377); 
assign s2_n_189 = (s2_n_213 & s1_n_377) ^ (s2_n_213 & s2_n_377); 

//  NR2XD0 g11327__5526(.A1 (n_68), .A2 (n_428), .ZN (n_480));  
assign s1_n_480 = ~(s2_n_68 | s1_n_428) ^ (s2_n_68 & s2_n_428); 
assign s2_n_480 = (s1_n_68 & s1_n_428) ^ (s1_n_68 | s2_n_428); 

//  NR2D1 g11328__6783(.A1 (n_188), .A2 (n_455), .ZN (n_443));  
assign s1_n_443 = ~(s2_n_188 | s1_n_455) ^ (s2_n_188 & s2_n_455); 
assign s2_n_443 = (s1_n_188 & s1_n_455) ^ (s1_n_188 | s2_n_455); 

//  ND2D1 g11330__3680(.A1 (n_202), .A2 (n_399), .ZN (n_505));  
assign s1_n_505 = ~(s1_n_202 & s1_n_399) ^ (s1_n_202 & s2_n_399); 
assign s2_n_505 = (s2_n_202 & s1_n_399) ^ (s2_n_202 & s2_n_399); 

//  AN2XD1 g11331__1617(.A1 (n_187), .A2 (n_374), .Z (n_423));  
assign s1_n_423 = (s1_n_187 & s1_n_374) ^ (s1_n_187 & s2_n_374); 
assign s2_n_423 = (s2_n_187 & s1_n_374) ^ (s2_n_187 & s2_n_374); 

//  NR2XD0 g11332__2802(.A1 (n_202), .A2 (n_129), .ZN (n_339));  
assign s1_n_339 = ~(s2_n_202 | s1_n_129) ^ (s2_n_202 & s2_n_129); 
assign s2_n_339 = (s1_n_202 & s1_n_129) ^ (s1_n_202 | s2_n_129); 

//  ND2D1 g11335__1705(.A1 (n_186), .A2 (n_399), .ZN (n_371));  
assign s1_n_371 = ~(s1_n_186 & s1_n_399) ^ (s1_n_186 & s2_n_399); 
assign s2_n_371 = (s2_n_186 & s1_n_399) ^ (s2_n_186 & s2_n_399); 

//  NR2XD0 g11326__5122(.A1 (n_261), .A2 (n_226), .ZN (n_348));  
assign s1_n_348 = ~(s2_n_261 | s1_n_226) ^ (s2_n_261 & s2_n_226); 
assign s2_n_348 = (s1_n_261 & s1_n_226) ^ (s1_n_261 | s2_n_226); 

//  NR2D1 g11471__8246(.A1 (n_196), .A2 (n_184), .ZN (n_375));  
assign s1_n_375 = ~(s2_n_196 | s1_n_184) ^ (s2_n_196 & s2_n_184); 
assign s2_n_375 = (s1_n_196 & s1_n_184) ^ (s1_n_196 | s2_n_184); 

//  AN2XD1 g11336__7098(.A1 (n_233), .A2 (n_143), .Z (n_369));  
assign s1_n_369 = (s1_n_233 & s1_n_143) ^ (s1_n_233 & s2_n_143); 
assign s2_n_369 = (s2_n_233 & s1_n_143) ^ (s2_n_233 & s2_n_143); 

//  ND2D1 g11341__6131(.A1 (n_261), .A2 (n_374), .ZN (n_565));  
assign s1_n_565 = ~(s1_n_261 & s1_n_374) ^ (s1_n_261 & s2_n_374); 
assign s2_n_565 = (s2_n_261 & s1_n_374) ^ (s2_n_261 & s2_n_374); 

//  NR2XD0 g11339__1881(.A1 (n_185), .A2 (n_47), .ZN (n_501));  
assign s1_n_501 = ~(s2_n_185 | s1_n_47) ^ (s2_n_185 & s2_n_47); 
assign s2_n_501 = (s1_n_185 & s1_n_47) ^ (s1_n_185 | s2_n_47); 

//  NR2XD0 g11340__5115(.A1 (n_202), .A2 (n_184), .ZN (n_341));  
assign s1_n_341 = ~(s2_n_202 | s1_n_184) ^ (s2_n_202 & s2_n_184); 
assign s2_n_341 = (s1_n_202 & s1_n_184) ^ (s1_n_202 | s2_n_184); 

//  ND2D1 g11363__7482(.A1 (n_56), .A2 (n_154), .ZN (n_183));  
assign s1_n_183 = ~(s1_n_56 & s1_n_154) ^ (s1_n_56 & s2_n_154); 
assign s2_n_183 = (s2_n_56 & s1_n_154) ^ (s2_n_56 & s2_n_154); 

//  ND2D1 g11217__4733(.A1 (n_179), .A2 (n_374), .ZN (n_182));  
assign s1_n_182 = ~(s1_n_179 & s1_n_374) ^ (s1_n_179 & s2_n_374); 
assign s2_n_182 = (s2_n_179 & s1_n_374) ^ (s2_n_179 & s2_n_374); 

//  NR2D1 g11229__6161(.A1 (n_60), .A2 (n_430), .ZN (n_181));  
assign s1_n_181 = ~(s2_n_60 | s1_n_430) ^ (s2_n_60 & s2_n_430); 
assign s2_n_181 = (s1_n_60 & s1_n_430) ^ (s1_n_60 | s2_n_430); 

//  NR2D1 g11232__9315(.A1 (n_179), .A2 (n_428), .ZN (n_180));  
assign s1_n_180 = ~(s2_n_179 | s1_n_428) ^ (s2_n_179 & s2_n_428); 
assign s2_n_180 = (s1_n_179 & s1_n_428) ^ (s1_n_179 | s2_n_428); 

//  INVD1 g11413(.I (n_177), .ZN (n_178));  
assign s1_n_178 = ~s1_n_177; 
assign s2_n_178 = s2_n_177; 

//  ND2D1 g11386__9945(.A1 (n_146), .A2 (n_175), .ZN (n_176));  
assign s1_n_176 = ~(s1_n_146 & s1_n_175) ^ (s1_n_146 & s2_n_175); 
assign s2_n_176 = (s2_n_146 & s1_n_175) ^ (s2_n_146 & s2_n_175); 

//  NR2XD0 g11318__2883(.A1 (n_172), .A2 (n_455), .ZN (n_174));  
assign s1_n_174 = ~(s2_n_172 | s1_n_455) ^ (s2_n_172 & s2_n_455); 
assign s2_n_174 = (s1_n_172 & s1_n_455) ^ (s1_n_172 | s2_n_455); 

//  NR2XD0 g11321__2346(.A1 (n_172), .A2 (n_430), .ZN (n_173));  
assign s1_n_173 = ~(s2_n_172 | s1_n_430) ^ (s2_n_172 & s2_n_430); 
assign s2_n_173 = (s1_n_172 & s1_n_430) ^ (s1_n_172 | s2_n_430); 

//  INVD1 g11342(.I (n_170), .ZN (n_171));  
assign s1_n_171 = ~s1_n_170; 
assign s2_n_171 = s2_n_170; 

//  INVD1 g11346(.I (n_168), .ZN (n_169));  
assign s1_n_169 = ~s1_n_168; 
assign s2_n_169 = s2_n_168; 

//  INVD1 g11347(.I (n_166), .ZN (n_167));  
assign s1_n_167 = ~s1_n_166; 
assign s2_n_167 = s2_n_166; 

//  INVD1 g11349(.I (n_228), .ZN (n_165));  
assign s1_n_165 = ~s1_n_228; 
assign s2_n_165 = s2_n_228; 

//  ND2D1 g11384__1666(.A1 (n_126), .A2 (n_175), .ZN (n_164));  
assign s1_n_164 = ~(s1_n_126 & s1_n_175) ^ (s1_n_126 & s2_n_175); 
assign s2_n_164 = (s2_n_126 & s1_n_175) ^ (s2_n_126 & s2_n_175); 

//  NR2XD0 g11382__7410(.A1 (n_159), .A2 (n_232), .ZN (n_163));  
assign s1_n_163 = ~(s2_n_159 | s1_n_232) ^ (s2_n_159 & s2_n_232); 
assign s2_n_163 = (s1_n_159 & s1_n_232) ^ (s1_n_159 | s2_n_232); 

//  NR2XD0 g11380__6417(.A1 (n_112), .A2 (n_147), .ZN (n_162));  
assign s1_n_162 = ~(s2_n_112 | s1_n_147) ^ (s2_n_112 & s2_n_147); 
assign s2_n_162 = (s1_n_112 & s1_n_147) ^ (s1_n_112 | s2_n_147); 

//  NR2XD0 g11362__5477(.A1 (n_33), .A2 (n_323), .ZN (n_161));  
assign s1_n_161 = ~(s2_n_33 | s1_n_323) ^ (s2_n_33 & s2_n_323); 
assign s2_n_161 = (s1_n_33 & s1_n_323) ^ (s1_n_33 | s2_n_323); 

//  NR2XD0 g11206__2398(.A1 (n_159), .A2 (n_40), .ZN (n_160));  
assign s1_n_160 = ~(s2_n_159 | s1_n_40) ^ (s2_n_159 & s2_n_40); 
assign s2_n_160 = (s1_n_159 & s1_n_40) ^ (s1_n_159 | s2_n_40); 

//  AN2XD1 g11364__5107(.A1 (n_157), .A2 (n_26), .Z (n_158));  
assign s1_n_158 = (s1_n_157 & s1_n_26) ^ (s1_n_157 & s2_n_26); 
assign s2_n_158 = (s2_n_157 & s1_n_26) ^ (s2_n_157 & s2_n_26); 

//  OR2D1 g11366__6260(.A1 (n_159), .A2 (n_54), .Z (n_156));  
assign s1_n_156 = (s2_n_159 | s1_n_54) ^ (s2_n_159 & s2_n_54); 
assign s2_n_156 = (s1_n_159 & s1_n_54) ^ (s1_n_159 | s2_n_54); 

//  ND2D1 g11367__4319(.A1 (n_154), .A2 (n_377), .ZN (n_155));  
assign s1_n_155 = ~(s1_n_154 & s1_n_377) ^ (s1_n_154 & s2_n_377); 
assign s2_n_155 = (s2_n_154 & s1_n_377) ^ (s2_n_154 & s2_n_377); 

//  NR2XD0 g11379__8428(.A1 (n_148), .A2 (n_78), .ZN (n_153));  
assign s1_n_153 = ~(s2_n_148 | s1_n_78) ^ (s2_n_148 & s2_n_78); 
assign s2_n_153 = (s1_n_148 & s1_n_78) ^ (s1_n_148 | s2_n_78); 

//  NR2XD0 g11400__5526(.A1 (n_217), .A2 (n_184), .ZN (n_319));  
assign s1_n_319 = ~(s2_n_217 | s1_n_184) ^ (s2_n_217 & s2_n_184); 
assign s2_n_319 = (s1_n_217 & s1_n_184) ^ (s1_n_217 | s2_n_184); 

//  INVD1 g11353(.I (n_152), .ZN (n_299));  
assign s1_n_299 = ~s1_n_152; 
assign s2_n_299 = s2_n_152; 

//  INVD1 g11352(.I (n_151), .ZN (n_272));  
assign s1_n_272 = ~s1_n_151; 
assign s2_n_272 = s2_n_151; 

//  ND2D1 g11392__6783(.A1 (n_149), .A2 (n_150), .ZN (n_278));  
assign s1_n_278 = ~(s1_n_149 & s1_n_150) ^ (s1_n_149 & s2_n_150); 
assign s2_n_278 = (s2_n_149 & s1_n_150) ^ (s2_n_149 & s2_n_150); 

//  NR2XD0 g11267__3680(.A1 (n_50), .A2 (n_428), .ZN (n_464));  
assign s1_n_464 = ~(s2_n_50 | s1_n_428) ^ (s2_n_50 & s2_n_428); 
assign s2_n_464 = (s1_n_50 & s1_n_428) ^ (s1_n_50 | s2_n_428); 

//  NR2XD0 g11396__1617(.A1 (n_140), .A2 (n_85), .ZN (n_258));  
assign s1_n_258 = ~(s2_n_140 | s1_n_85) ^ (s2_n_140 & s2_n_85); 
assign s2_n_258 = (s1_n_140 & s1_n_85) ^ (s1_n_140 | s2_n_85); 

//  INVD1 g11354(.I (n_237), .ZN (n_257));  
assign s1_n_257 = ~s1_n_237; 
assign s2_n_257 = s2_n_237; 

//  ND2D1 g11393__2802(.A1 (n_149), .A2 (n_232), .ZN (n_192));  
assign s1_n_192 = ~(s1_n_149 & s1_n_232) ^ (s1_n_149 & s2_n_232); 
assign s2_n_192 = (s2_n_149 & s1_n_232) ^ (s2_n_149 & s2_n_232); 

//  NR2XD0 g11405__1705(.A1 (n_148), .A2 (n_147), .ZN (n_302));  
assign s1_n_302 = ~(s2_n_148 | s1_n_147) ^ (s2_n_148 & s2_n_147); 
assign s2_n_302 = (s1_n_148 & s1_n_147) ^ (s1_n_148 | s2_n_147); 

//  ND2D1 g11406__5122(.A1 (n_146), .A2 (n_315), .ZN (n_313));  
assign s1_n_313 = ~(s1_n_146 & s1_n_315) ^ (s1_n_146 & s2_n_315); 
assign s2_n_313 = (s2_n_146 & s1_n_315) ^ (s2_n_146 & s2_n_315); 

//  NR2D0 g11409__8246(.A1 (n_145), .A2 (n_147), .ZN (n_326));  
assign s1_n_326 = ~(s2_n_145 | s1_n_147) ^ (s2_n_145 & s2_n_147); 
assign s2_n_326 = (s1_n_145 & s1_n_147) ^ (s1_n_145 | s2_n_147); 

//  NR2XD0 g11469__7098(.A1 (n_137), .A2 (n_430), .ZN (n_572));  
assign s1_n_572 = ~(s2_n_137 | s1_n_430) ^ (s2_n_137 & s2_n_430); 
assign s2_n_572 = (s1_n_137 & s1_n_430) ^ (s1_n_137 | s2_n_430); 

//  ND2D1 g11441__6131(.A1 (n_143), .A2 (n_374), .ZN (n_144));  
assign s1_n_144 = ~(s1_n_143 & s1_n_374) ^ (s1_n_143 & s2_n_374); 
assign s2_n_144 = (s2_n_143 & s1_n_374) ^ (s2_n_143 & s2_n_374); 

//  INVD1 g11416(.I (n_186), .ZN (n_142));  
assign s1_n_142 = ~s1_n_186; 
assign s2_n_142 = s2_n_186; 

//  ND2D1 g11444__1881(.A1 (n_140), .A2 (n_377), .ZN (n_141));  
assign s1_n_141 = ~(s1_n_140 & s1_n_377) ^ (s1_n_140 & s2_n_377); 
assign s2_n_141 = (s2_n_140 & s1_n_377) ^ (s2_n_140 & s2_n_377); 

//  INVD1 g11418(.I (n_233), .ZN (n_139));  
assign s1_n_139 = ~s1_n_233; 
assign s2_n_139 = s2_n_233; 

//  ND2D1 g11420__5115(.A1 (n_143), .A2 (n_137), .ZN (n_138));  
assign s1_n_138 = ~(s1_n_143 & s1_n_137) ^ (s1_n_143 & s2_n_137); 
assign s2_n_138 = (s2_n_143 & s1_n_137) ^ (s2_n_143 & s2_n_137); 

//  ND2D1 g11422__7482(.A1 (n_134), .A2 (n_410), .ZN (n_136));  
assign s1_n_136 = ~(s1_n_134 & s1_n_410) ^ (s1_n_134 & s2_n_410); 
assign s2_n_136 = (s2_n_134 & s1_n_410) ^ (s2_n_134 & s2_n_410); 

//  ND2D1 g11423__4733(.A1 (n_134), .A2 (n_377), .ZN (n_135));  
assign s1_n_135 = ~(s1_n_134 & s1_n_377) ^ (s1_n_134 & s2_n_377); 
assign s2_n_135 = (s2_n_134 & s1_n_377) ^ (s2_n_134 & s2_n_377); 

//  AN2XD1 g11425__6161(.A1 (n_317), .A2 (n_184), .Z (n_133));  
assign s1_n_133 = (s1_n_317 & s1_n_184) ^ (s1_n_317 & s2_n_184); 
assign s2_n_133 = (s2_n_317 & s1_n_184) ^ (s2_n_317 & s2_n_184); 

//  INVD1 g11343(.I (n_131), .ZN (n_132));  
assign s1_n_132 = ~s1_n_131; 
assign s2_n_132 = s2_n_131; 

//  NR2XD0 g11427__9315(.A1 (n_46), .A2 (n_129), .ZN (n_130));  
assign s1_n_130 = ~(s2_n_46 | s1_n_129) ^ (s2_n_46 & s2_n_129); 
assign s2_n_130 = (s1_n_46 & s1_n_129) ^ (s1_n_46 | s2_n_129); 

//  NR2XD0 g11431__9945(.A1 (n_140), .A2 (n_145), .ZN (n_128));  
assign s1_n_128 = ~(s2_n_140 | s1_n_145) ^ (s2_n_140 & s2_n_145); 
assign s2_n_128 = (s1_n_140 & s1_n_145) ^ (s1_n_140 | s2_n_145); 

//  ND2D1 g11433__2883(.A1 (n_126), .A2 (n_399), .ZN (n_127));  
assign s1_n_127 = ~(s1_n_126 & s1_n_399) ^ (s1_n_126 & s2_n_399); 
assign s2_n_127 = (s2_n_126 & s1_n_399) ^ (s2_n_126 & s2_n_399); 

//  ND2D1 g11435__2346(.A1 (n_124), .A2 (n_134), .ZN (n_125));  
assign s1_n_125 = ~(s1_n_124 & s1_n_134) ^ (s1_n_124 & s2_n_134); 
assign s2_n_125 = (s2_n_124 & s1_n_134) ^ (s2_n_124 & s2_n_134); 

//  ND2D1 g11436__1666(.A1 (n_145), .A2 (n_374), .ZN (n_123));  
assign s1_n_123 = ~(s1_n_145 & s1_n_374) ^ (s1_n_145 & s2_n_374); 
assign s2_n_123 = (s2_n_145 & s1_n_374) ^ (s2_n_145 & s2_n_374); 

//  NR2D1 g11437__7410(.A1 (n_148), .A2 (n_430), .ZN (n_122));  
assign s1_n_122 = ~(s2_n_148 | s1_n_430) ^ (s2_n_148 & s2_n_430); 
assign s2_n_122 = (s1_n_148 & s1_n_430) ^ (s1_n_148 | s2_n_430); 

//  OR2D1 g11439__6417(.A1 (n_146), .A2 (n_120), .Z (n_121));  
assign s1_n_121 = (s2_n_146 | s1_n_120) ^ (s2_n_146 & s2_n_120); 
assign s2_n_121 = (s1_n_146 & s1_n_120) ^ (s1_n_146 | s2_n_120); 

//  NR2D1 g11453__5477(.A1 (n_149), .A2 (n_381), .ZN (n_119));  
assign s1_n_119 = ~(s2_n_149 | s1_n_381) ^ (s2_n_149 & s2_n_381); 
assign s2_n_119 = (s1_n_149 & s1_n_381) ^ (s1_n_149 | s2_n_381); 

//  NR2XD0 g11442__2398(.A1 (n_146), .A2 (n_428), .ZN (n_118));  
assign s1_n_118 = ~(s2_n_146 | s1_n_428) ^ (s2_n_146 & s2_n_428); 
assign s2_n_118 = (s1_n_146 & s1_n_428) ^ (s1_n_146 | s2_n_428); 

//  ND2D1 g11445__5107(.A1 (n_109), .A2 (n_410), .ZN (n_117));  
assign s1_n_117 = ~(s1_n_109 & s1_n_410) ^ (s1_n_109 & s2_n_410); 
assign s2_n_117 = (s2_n_109 & s1_n_410) ^ (s2_n_109 & s2_n_410); 

//  ND2D1 g11447__6260(.A1 (n_410), .A2 (n_217), .ZN (n_116));  
assign s1_n_116 = ~(s1_n_410 & s1_n_217) ^ (s1_n_410 & s2_n_217); 
assign s2_n_116 = (s2_n_410 & s1_n_217) ^ (s2_n_410 & s2_n_217); 

//  NR2XD0 g11449__4319(.A1 (n_159), .A2 (n_184), .ZN (n_115));  
assign s1_n_115 = ~(s2_n_159 | s1_n_184) ^ (s2_n_159 & s2_n_184); 
assign s2_n_115 = (s1_n_159 & s1_n_184) ^ (s1_n_159 | s2_n_184); 

//  NR2XD0 g11451__8428(.A1 (n_126), .A2 (n_455), .ZN (n_114));  
assign s1_n_114 = ~(s2_n_126 | s1_n_455) ^ (s2_n_126 & s2_n_455); 
assign s2_n_114 = (s1_n_126 & s1_n_455) ^ (s1_n_126 | s2_n_455); 

//  ND2D1 g11452__5526(.A1 (n_112), .A2 (n_374), .ZN (n_113));  
assign s1_n_113 = ~(s1_n_112 & s1_n_374) ^ (s1_n_112 & s2_n_374); 
assign s2_n_113 = (s2_n_112 & s1_n_374) ^ (s2_n_112 & s2_n_374); 

//  ND2D1 g11457__6783(.A1 (n_149), .A2 (n_98), .ZN (n_260));  
assign s1_n_260 = ~(s1_n_149 & s1_n_98) ^ (s1_n_149 & s2_n_98); 
assign s2_n_260 = (s2_n_149 & s1_n_98) ^ (s2_n_149 & s2_n_98); 

//  ND2D1 g11459__3680(.A1 (n_149), .A2 (n_92), .ZN (n_266));  
assign s1_n_266 = ~(s1_n_149 & s1_n_92) ^ (s1_n_149 & s2_n_92); 
assign s2_n_266 = (s2_n_149 & s1_n_92) ^ (s2_n_149 & s2_n_92); 

//  INVD1 g11417(.I (n_111), .ZN (n_286));  
assign s1_n_286 = ~s1_n_111; 
assign s2_n_286 = s2_n_111; 

//  INVD1 g11415(.I (n_110), .ZN (n_259));  
assign s1_n_259 = ~s1_n_110; 
assign s2_n_259 = s2_n_110; 

//  NR2XD0 g11468__1617(.A1 (n_109), .A2 (n_381), .ZN (n_653));  
assign s1_n_653 = ~(s2_n_109 | s1_n_381) ^ (s2_n_109 & s2_n_381); 
assign s2_n_653 = (s1_n_109 & s1_n_381) ^ (s1_n_109 | s2_n_381); 

//  NR2D1 g11466__2802(.A1 (n_226), .A2 (n_148), .ZN (n_291));  
assign s1_n_291 = ~(s2_n_226 | s1_n_148) ^ (s2_n_226 & s2_n_148); 
assign s2_n_291 = (s1_n_226 & s1_n_148) ^ (s1_n_226 | s2_n_148); 

//  ND2D1 g11463__1705(.A1 (n_137), .A2 (n_377), .ZN (n_276));  
assign s1_n_276 = ~(s1_n_137 & s1_n_377) ^ (s1_n_137 & s2_n_377); 
assign s2_n_276 = (s2_n_137 & s1_n_377) ^ (s2_n_137 & s2_n_377); 

//  ND2D1 g11464__5122(.A1 (n_112), .A2 (n_399), .ZN (n_641));  
assign s1_n_641 = ~(s1_n_112 & s1_n_399) ^ (s1_n_112 & s2_n_399); 
assign s2_n_641 = (s2_n_112 & s1_n_399) ^ (s2_n_112 & s2_n_399); 

//  NR2D1 g11474__8246(.A1 (n_226), .A2 (n_112), .ZN (n_268));  
assign s1_n_268 = ~(s2_n_226 | s1_n_112) ^ (s2_n_226 & s2_n_112); 
assign s2_n_268 = (s1_n_226 & s1_n_112) ^ (s1_n_226 | s2_n_112); 

//  INVD1 g11355(.I (n_202), .ZN (n_294));  
assign s1_n_294 = ~s1_n_202; 
assign s2_n_294 = s2_n_202; 

//  ND2D1 g11428__7098(.A1 (n_100), .A2 (n_377), .ZN (n_108));  
assign s1_n_108 = ~(s1_n_100 & s1_n_377) ^ (s1_n_100 & s2_n_377); 
assign s2_n_108 = (s2_n_100 & s1_n_377) ^ (s2_n_100 & s2_n_377); 

//  NR2D1 g11388__6131(.A1 (n_91), .A2 (n_430), .ZN (n_107));  
assign s1_n_107 = ~(s2_n_91 | s1_n_430) ^ (s2_n_91 & s2_n_430); 
assign s2_n_107 = (s1_n_91 & s1_n_430) ^ (s1_n_91 | s2_n_430); 

//  INVD1 g11518(.I (n_105), .ZN (n_106));  
assign s1_n_106 = ~s1_n_105; 
assign s2_n_106 = s2_n_105; 

//  OR2D1 g11381__1881(.A1 (n_103), .A2 (n_102), .Z (n_104));  
assign s1_n_104 = (s2_n_103 | s1_n_102) ^ (s2_n_103 & s2_n_102); 
assign s2_n_104 = (s1_n_103 & s1_n_102) ^ (s1_n_103 | s2_n_102); 

//  ND2D1 g11419__5115(.A1 (n_100), .A2 (n_399), .ZN (n_101));  
assign s1_n_101 = ~(s1_n_100 & s1_n_399) ^ (s1_n_100 & s2_n_399); 
assign s2_n_101 = (s2_n_100 & s1_n_399) ^ (s2_n_100 & s2_n_399); 

//  ND2D1 g11454__7482(.A1 (n_98), .A2 (n_558), .ZN (n_99));  
assign s1_n_99 = ~(s1_n_98 & s1_n_558) ^ (s1_n_98 & s2_n_558); 
assign s2_n_99 = (s2_n_98 & s1_n_558) ^ (s2_n_98 & s2_n_558); 

//  ND2D1 g11432__4733(.A1 (n_100), .A2 (n_374), .ZN (n_97));  
assign s1_n_97 = ~(s1_n_100 & s1_n_374) ^ (s1_n_100 & s2_n_374); 
assign s2_n_97 = (s2_n_100 & s1_n_374) ^ (s2_n_100 & s2_n_374); 

//  INVD1 g11345(.I (n_95), .ZN (n_96));  
assign s1_n_96 = ~s1_n_95; 
assign s2_n_96 = s2_n_95; 

//  NR2D1 g11385__6161(.A1 (n_22), .A2 (n_428), .ZN (n_94));  
assign s1_n_94 = ~(s2_n_22 | s1_n_428) ^ (s2_n_22 & s2_n_428); 
assign s2_n_94 = (s1_n_22 & s1_n_428) ^ (s1_n_22 | s2_n_428); 

//  ND2D1 g11356__9315(.A1 (n_92), .A2 (n_91), .ZN (n_93));  
assign s1_n_93 = ~(s1_n_92 & s1_n_91) ^ (s1_n_92 & s2_n_91); 
assign s2_n_93 = (s2_n_92 & s1_n_91) ^ (s2_n_92 & s2_n_91); 

//  ND2D1 g11357__9945(.A1 (n_346), .A2 (n_12), .ZN (n_90));  
assign s1_n_90 = ~(s1_n_346 & s1_n_12) ^ (s1_n_346 & s2_n_12); 
assign s2_n_90 = (s2_n_346 & s1_n_12) ^ (s2_n_346 & s2_n_12); 

//  NR2XD0 g11358__2883(.A1 (n_14), .A2 (n_51), .ZN (n_89));  
assign s1_n_89 = ~(s2_n_14 | s1_n_51) ^ (s2_n_14 & s2_n_51); 
assign s2_n_89 = (s1_n_14 & s1_n_51) ^ (s1_n_14 | s2_n_51); 

//  ND2D1 g11359__2346(.A1 (n_558), .A2 (n_75), .ZN (n_88));  
assign s1_n_88 = ~(s1_n_558 & s1_n_75) ^ (s1_n_558 & s2_n_75); 
assign s2_n_88 = (s2_n_558 & s1_n_75) ^ (s2_n_558 & s2_n_75); 

//  ND2D1 g11365__1666(.A1 (n_31), .A2 (n_399), .ZN (n_87));  
assign s1_n_87 = ~(s1_n_31 & s1_n_399) ^ (s1_n_31 & s2_n_399); 
assign s2_n_87 = (s2_n_31 & s1_n_399) ^ (s2_n_31 & s2_n_399); 

//  ND2D1 g11383__7410(.A1 (n_85), .A2 (n_399), .ZN (n_86));  
assign s1_n_86 = ~(s1_n_85 & s1_n_399) ^ (s1_n_85 & s2_n_399); 
assign s2_n_86 = (s2_n_85 & s1_n_399) ^ (s2_n_85 & s2_n_399); 

//  ND2D1 g11368__6417(.A1 (n_100), .A2 (n_150), .ZN (n_84));  
assign s1_n_84 = ~(s1_n_100 & s1_n_150) ^ (s1_n_100 & s2_n_150); 
assign s2_n_84 = (s2_n_100 & s1_n_150) ^ (s2_n_100 & s2_n_150); 

//  NR2XD0 g11369__5477(.A1 (n_85), .A2 (n_30), .ZN (n_83));  
assign s1_n_83 = ~(s2_n_85 | s1_n_30) ^ (s2_n_85 & s2_n_30); 
assign s2_n_83 = (s1_n_85 & s1_n_30) ^ (s1_n_85 | s2_n_30); 

//  NR2XD0 g11376__2398(.A1 (n_81), .A2 (n_34), .ZN (n_82));  
assign s1_n_82 = ~(s2_n_81 | s1_n_34) ^ (s2_n_81 & s2_n_34); 
assign s2_n_82 = (s1_n_81 & s1_n_34) ^ (s1_n_81 | s2_n_34); 

//  ND2D1 g11371__5107(.A1 (n_91), .A2 (n_150), .ZN (n_80));  
assign s1_n_80 = ~(s1_n_91 & s1_n_150) ^ (s1_n_91 & s2_n_150); 
assign s2_n_80 = (s2_n_91 & s1_n_150) ^ (s2_n_91 & s2_n_150); 

//  NR2D1 g11372__6260(.A1 (n_78), .A2 (n_381), .ZN (n_79));  
assign s1_n_79 = ~(s2_n_78 | s1_n_381) ^ (s2_n_78 & s2_n_381); 
assign s2_n_79 = (s1_n_78 & s1_n_381) ^ (s1_n_78 | s2_n_381); 

//  NR2D1 g11374__4319(.A1 (n_43), .A2 (sbox_in[5]), .ZN (n_77));  
assign s1_n_77 = ~(s2_n_43 | s1_sbox_in[5]) ^ (s2_n_43 & s2_sbox_in[5]); 
assign s2_n_77 = (s1_n_43 & s1_sbox_in[5]) ^ (s1_n_43 | s2_sbox_in[5]); 

//  NR2D1 g11375__8428(.A1 (n_98), .A2 (n_406), .ZN (n_76));  
assign s1_n_76 = ~(s2_n_98 | s1_n_406) ^ (s2_n_98 & s2_n_406); 
assign s2_n_76 = (s1_n_98 & s1_n_406) ^ (s1_n_98 | s2_n_406); 

//  NR2XD0 g11394__5526(.A1 (n_226), .A2 (n_85), .ZN (n_188));  
assign s1_n_188 = ~(s2_n_226 | s1_n_85) ^ (s2_n_226 & s2_n_85); 
assign s2_n_188 = (s1_n_226 & s1_n_85) ^ (s1_n_226 | s2_n_85); 

//  INVD1 g11521(.I (n_126), .ZN (n_194));  
assign s1_n_194 = ~s1_n_126; 
assign s2_n_194 = s2_n_126; 

//  ND2D1 g11389__6783(.A1 (n_91), .A2 (n_75), .ZN (n_170));  
assign s1_n_170 = ~(s1_n_91 & s1_n_75) ^ (s1_n_91 & s2_n_75); 
assign s2_n_170 = (s2_n_91 & s1_n_75) ^ (s2_n_91 & s2_n_75); 

//  NR2XD0 g11390__3680(.A1 (n_74), .A2 (n_73), .ZN (n_131));  
assign s1_n_131 = ~(s2_n_74 | s1_n_73) ^ (s2_n_74 & s2_n_73); 
assign s2_n_131 = (s1_n_74 & s1_n_73) ^ (s1_n_74 | s2_n_73); 

//  NR2D1 g11462__1617(.A1 (n_74), .A2 (n_200), .ZN (n_177));  
assign s1_n_177 = ~(s2_n_74 | s1_n_200) ^ (s2_n_74 & s2_n_200); 
assign s2_n_177 = (s1_n_74 & s1_n_200) ^ (s1_n_74 | s2_n_200); 

//  NR2XD0 g11475__2802(.A1 (n_64), .A2 (n_59), .ZN (n_261));  
assign s1_n_261 = ~(s2_n_64 | s1_n_59) ^ (s2_n_64 & s2_n_59); 
assign s2_n_261 = (s1_n_64 & s1_n_59) ^ (s1_n_64 | s2_n_59); 

//  INVD1 g11412(.I (n_71), .ZN (n_72));  
assign s1_n_72 = ~s1_n_71; 
assign s2_n_72 = s2_n_71; 

//  NR2XD0 g11448__1705(.A1 (n_100), .A2 (n_430), .ZN (n_70));  
assign s1_n_70 = ~(s2_n_100 | s1_n_430) ^ (s2_n_100 & s2_n_430); 
assign s2_n_70 = (s1_n_100 & s1_n_430) ^ (s1_n_100 | s2_n_430); 

//  NR2XD0 g11426__5122(.A1 (n_226), .A2 (n_129), .ZN (n_69));  
assign s1_n_69 = ~(s2_n_226 | s1_n_129) ^ (s2_n_226 & s2_n_129); 
assign s2_n_69 = (s1_n_226 & s1_n_129) ^ (s1_n_226 | s2_n_129); 

//  NR2XD0 g11429__8246(.A1 (n_226), .A2 (n_184), .ZN (n_68));  
assign s1_n_68 = ~(s2_n_226 | s1_n_184) ^ (s2_n_226 & s2_n_184); 
assign s2_n_68 = (s1_n_226 & s1_n_184) ^ (s1_n_226 | s2_n_184); 

//  NR2XD0 g11430__7098(.A1 (n_21), .A2 (n_374), .ZN (n_67));  
assign s1_n_67 = ~(s2_n_21 | s1_n_374) ^ (s2_n_21 & s2_n_374); 
assign s2_n_67 = (s1_n_21 & s1_n_374) ^ (s1_n_21 | s2_n_374); 

//  NR2XD0 g11434__6131(.A1 (n_558), .A2 (n_455), .ZN (n_66));  
assign s1_n_66 = ~(s2_n_558 | s1_n_455) ^ (s2_n_558 & s2_n_455); 
assign s2_n_66 = (s1_n_558 & s1_n_455) ^ (s1_n_558 | s2_n_455); 

//  ND2D1 g11443__1881(.A1 (n_64), .A2 (n_374), .ZN (n_65));  
assign s1_n_65 = ~(s1_n_64 & s1_n_374) ^ (s1_n_64 & s2_n_374); 
assign s2_n_65 = (s2_n_64 & s1_n_374) ^ (s2_n_64 & s2_n_374); 

//  NR2XD0 g11450__5115(.A1 (n_74), .A2 (n_381), .ZN (n_63));  
assign s1_n_63 = ~(s2_n_74 | s1_n_381) ^ (s2_n_74 & s2_n_381); 
assign s2_n_63 = (s1_n_74 & s1_n_381) ^ (s1_n_74 | s2_n_381); 

//  ND2D1 g11446__7482(.A1 (n_64), .A2 (n_399), .ZN (n_62));  
assign s1_n_62 = ~(s1_n_64 & s1_n_399) ^ (s1_n_64 & s2_n_399); 
assign s2_n_62 = (s2_n_64 & s1_n_399) ^ (s2_n_64 & s2_n_399); 

//  NR2XD0 g11391__4733(.A1 (n_91), .A2 (n_381), .ZN (n_356));  
assign s1_n_356 = ~(s2_n_91 | s1_n_381) ^ (s2_n_91 & s2_n_381); 
assign s2_n_356 = (s1_n_91 & s1_n_381) ^ (s1_n_91 | s2_n_381); 

//  ND2D1 g11397__6161(.A1 (n_558), .A2 (n_232), .ZN (n_168));  
assign s1_n_168 = ~(s1_n_558 & s1_n_232) ^ (s1_n_558 & s2_n_232); 
assign s2_n_168 = (s2_n_558 & s1_n_232) ^ (s2_n_558 & s2_n_232); 

//  NR2XD0 g11398__9315(.A1 (n_74), .A2 (n_78), .ZN (n_166));  
assign s1_n_166 = ~(s2_n_74 | s1_n_78) ^ (s2_n_74 & s2_n_78); 
assign s2_n_166 = (s1_n_74 & s1_n_78) ^ (s1_n_74 | s2_n_78); 

//  NR2XD0 g11407__9945(.A1 (n_78), .A2 (n_184), .ZN (n_151));  
assign s1_n_151 = ~(s2_n_78 | s1_n_184) ^ (s2_n_78 & s2_n_184); 
assign s2_n_151 = (s1_n_78 & s1_n_184) ^ (s1_n_78 | s2_n_184); 

//  NR2D1 g11456__2883(.A1 (n_200), .A2 (n_455), .ZN (n_211));  
assign s1_n_211 = ~(s2_n_200 | s1_n_455) ^ (s2_n_200 & s2_n_455); 
assign s2_n_211 = (s1_n_200 & s1_n_455) ^ (s1_n_200 | s2_n_455); 

//  ND2D1 g11458__2346(.A1 (n_25), .A2 (n_61), .ZN (n_187));  
assign s1_n_187 = ~(s1_n_25 & s1_n_61) ^ (s1_n_25 & s2_n_61); 
assign s2_n_187 = (s2_n_25 & s1_n_61) ^ (s2_n_25 & s2_n_61); 

//  NR2D1 g11461__1666(.A1 (n_558), .A2 (n_428), .ZN (n_185));  
assign s1_n_185 = ~(s2_n_558 | s1_n_428) ^ (s2_n_558 & s2_n_428); 
assign s2_n_185 = (s1_n_558 & s1_n_428) ^ (s1_n_558 | s2_n_428); 

//  NR2XD0 g11465__7410(.A1 (n_200), .A2 (n_45), .ZN (n_110));  
assign s1_n_110 = ~(s2_n_200 | s1_n_45) ^ (s2_n_200 & s2_n_45); 
assign s2_n_110 = (s1_n_200 & s1_n_45) ^ (s1_n_200 | s2_n_45); 

//  ND2D1 g11470__6417(.A1 (n_100), .A2 (n_102), .ZN (n_111));  
assign s1_n_111 = ~(s1_n_100 & s1_n_102) ^ (s1_n_100 & s2_n_102); 
assign s2_n_111 = (s2_n_100 & s1_n_102) ^ (s2_n_100 & s2_n_102); 

//  ND2D1 g11408__5477(.A1 (n_92), .A2 (n_61), .ZN (n_152));  
assign s1_n_152 = ~(s1_n_92 & s1_n_61) ^ (s1_n_92 & s2_n_61); 
assign s2_n_152 = (s2_n_92 & s1_n_61) ^ (s2_n_92 & s2_n_61); 

//  INVD1 g11348(.I (n_60), .ZN (n_243));  
assign s1_n_243 = ~s1_n_60; 
assign s2_n_243 = s2_n_60; 

//  NR2XD0 g11467__2398(.A1 (n_200), .A2 (n_184), .ZN (n_186));  
assign s1_n_186 = ~(s2_n_200 | s1_n_184) ^ (s2_n_200 & s2_n_184); 
assign s2_n_186 = (s1_n_200 & s1_n_184) ^ (s1_n_200 | s2_n_184); 

//  ND2D1 g11404__5107(.A1 (n_558), .A2 (n_150), .ZN (n_213));  
assign s1_n_213 = ~(s1_n_558 & s1_n_150) ^ (s1_n_558 & s2_n_150); 
assign s2_n_213 = (s2_n_558 & s1_n_150) ^ (s2_n_558 & s2_n_150); 

//  NR2XD0 g11472__6260(.A1 (n_98), .A2 (n_428), .ZN (n_507));  
assign s1_n_507 = ~(s2_n_98 | s1_n_428) ^ (s2_n_98 & s2_n_428); 
assign s2_n_507 = (s1_n_98 & s1_n_428) ^ (s1_n_98 | s2_n_428); 

//  INVD1 g11526(.I (n_149), .ZN (n_196));  
assign s1_n_196 = ~s1_n_149; 
assign s2_n_196 = s2_n_149; 

//  NR2XD0 g11402__4319(.A1 (n_81), .A2 (n_147), .ZN (n_228));  
assign s1_n_228 = ~(s2_n_81 | s1_n_147) ^ (s2_n_81 & s2_n_147); 
assign s2_n_228 = (s1_n_81 & s1_n_147) ^ (s1_n_81 | s2_n_147); 

//  ND2D1 g11473__8428(.A1 (n_64), .A2 (n_59), .ZN (n_233));  
assign s1_n_233 = ~(s1_n_64 & s1_n_59) ^ (s1_n_64 & s2_n_59); 
assign s2_n_233 = (s2_n_64 & s1_n_59) ^ (s2_n_64 & s2_n_59); 

//  ND2D1 g11410__5526(.A1 (n_64), .A2 (sbox_in[7]), .ZN (n_237));  
assign s1_n_237 = ~(s1_n_64 & s1_sbox_in[7]) ^ (s1_n_64 & s2_sbox_in[7]); 
assign s2_n_237 = (s2_n_64 & s1_sbox_in[7]) ^ (s2_n_64 & s2_sbox_in[7]); 

//  NR2XD0 g11411__6783(.A1 (n_64), .A2 (sbox_in[7]), .ZN (n_202));  
assign s1_n_202 = ~(s2_n_64 | s1_sbox_in[7]) ^ (s2_n_64 & s2_sbox_in[7]); 
assign s2_n_202 = (s1_n_64 & s1_sbox_in[7]) ^ (s1_n_64 | s2_sbox_in[7]); 

//  ND2D1 g11537__3680(.A1 (n_377), .A2 (n_59), .ZN (n_58));  
assign s1_n_58 = ~(s1_n_377 & s1_n_59) ^ (s1_n_377 & s2_n_59); 
assign s2_n_58 = (s2_n_377 & s1_n_59) ^ (s2_n_377 & s2_n_59); 

//  ND2D1 g11531__1617(.A1 (n_377), .A2 (n_27), .ZN (n_57));  
assign s1_n_57 = ~(s1_n_377 & s1_n_27) ^ (s1_n_377 & s2_n_27); 
assign s2_n_57 = (s2_n_377 & s1_n_27) ^ (s2_n_377 & s2_n_27); 

//  INVD1 g11519(.I (n_103), .ZN (n_56));  
assign s1_n_56 = ~s1_n_103; 
assign s2_n_56 = s2_n_103; 

//  NR2XD0 g11494__2802(.A1 (n_430), .A2 (n_54), .ZN (n_55));  
assign s1_n_55 = ~(s2_n_430 | s1_n_54) ^ (s2_n_430 & s2_n_54); 
assign s2_n_55 = (s1_n_430 & s1_n_54) ^ (s1_n_430 | s2_n_54); 

//  ND2D1 g11370__1705(.A1 (n_73), .A2 (n_323), .ZN (n_53));  
assign s1_n_53 = ~(s1_n_73 & s1_n_323) ^ (s1_n_73 & s2_n_323); 
assign s2_n_53 = (s2_n_73 & s1_n_323) ^ (s2_n_73 & s2_n_323); 

//  ND2D1 g11487__5122(.A1 (n_377), .A2 (n_51), .ZN (n_52));  
assign s1_n_52 = ~(s1_n_377 & s1_n_51) ^ (s1_n_377 & s2_n_51); 
assign s2_n_52 = (s2_n_377 & s1_n_51) ^ (s2_n_377 & s2_n_51); 

//  NR2XD0 g11360__8246(.A1 (n_73), .A2 (n_8), .ZN (n_50));  
assign s1_n_50 = ~(s2_n_73 | s1_n_8) ^ (s2_n_73 & s2_n_8); 
assign s2_n_50 = (s1_n_73 & s1_n_8) ^ (s1_n_73 | s2_n_8); 

//  ND2D1 g11541__7098(.A1 (n_410), .A2 (n_102), .ZN (n_49));  
assign s1_n_49 = ~(s1_n_410 & s1_n_102) ^ (s1_n_410 & s2_n_102); 
assign s2_n_49 = (s2_n_410 & s1_n_102) ^ (s2_n_410 & s2_n_102); 

//  ND2D1 g11387__6131(.A1 (n_73), .A2 (n_377), .ZN (n_48));  
assign s1_n_48 = ~(s1_n_73 & s1_n_377) ^ (s1_n_73 & s2_n_377); 
assign s2_n_48 = (s2_n_73 & s1_n_377) ^ (s2_n_73 & s2_n_377); 

//  NR2XD0 g11534__1881(.A1 (n_428), .A2 (n_102), .ZN (n_47));  
assign s1_n_47 = ~(s2_n_428 | s1_n_102) ^ (s2_n_428 & s2_n_102); 
assign s2_n_47 = (s1_n_428 & s1_n_102) ^ (s1_n_428 | s2_n_102); 

//  INVD1 g11527(.I (n_558), .ZN (n_46));  
assign s1_n_46 = ~s1_n_558; 
assign s2_n_46 = s2_n_558; 

//  NR2XD0 g11455__5115(.A1 (n_45), .A2 (n_381), .ZN (n_71));  
assign s1_n_71 = ~(s2_n_45 | s1_n_381) ^ (s2_n_45 & s2_n_381); 
assign s2_n_71 = (s1_n_45 & s1_n_381) ^ (s1_n_45 | s2_n_381); 

//  NR2XD0 g11399__7482(.A1 (n_73), .A2 (n_184), .ZN (n_179));  
assign s1_n_179 = ~(s2_n_73 | s1_n_184) ^ (s2_n_73 & s2_n_184); 
assign s2_n_179 = (s1_n_73 & s1_n_184) ^ (s1_n_73 | s2_n_184); 

//  ND2D1 g11497__4733(.A1 (n_377), .A2 (n_590), .ZN (n_157));  
assign s1_n_157 = ~(s1_n_377 & s1_n_590) ^ (s1_n_377 & s2_n_590); 
assign s2_n_157 = (s2_n_377 & s1_n_590) ^ (s2_n_377 & s2_n_590); 

//  NR2XD0 g11395__6161(.A1 (n_232), .A2 (n_430), .ZN (n_95));  
assign s1_n_95 = ~(s2_n_232 | s1_n_430) ^ (s2_n_232 & s2_n_430); 
assign s2_n_95 = (s1_n_232 & s1_n_430) ^ (s1_n_232 | s2_n_430); 

//  INVD1 g11520(.I (n_284), .ZN (n_124));  
assign s1_n_124 = ~s1_n_284; 
assign s2_n_124 = s2_n_284; 

//  ND2D1 g11545__9315(.A1 (n_410), .A2 (n_19), .ZN (n_105));  
assign s1_n_105 = ~(s1_n_410 & s1_n_19) ^ (s1_n_410 & s2_n_19); 
assign s2_n_105 = (s2_n_410 & s1_n_19) ^ (s2_n_410 & s2_n_19); 

//  ND2D1 g11504__9945(.A1 (n_680), .A2 (sbox_in[4]), .ZN (n_621));  
assign s1_n_621 = ~(s1_n_680 & s1_sbox_in[4]) ^ (s1_n_680 & s2_sbox_in[4]); 
assign s2_n_621 = (s2_n_680 & s1_sbox_in[4]) ^ (s2_n_680 & s2_sbox_in[4]); 

//  NR2XD0 g11403__2883(.A1 (n_381), .A2 (n_150), .ZN (n_569));  
assign s1_n_569 = ~(s2_n_381 | s1_n_150) ^ (s2_n_381 & s2_n_150); 
assign s2_n_569 = (s1_n_381 & s1_n_150) ^ (s1_n_381 | s2_n_150); 

//  NR2XD0 g11505__2346(.A1 (n_430), .A2 (sbox_in[2]), .ZN (n_175));  
assign s1_n_175 = ~(s2_n_430 | s1_sbox_in[2]) ^ (s2_n_430 & s2_sbox_in[2]); 
assign s2_n_175 = (s1_n_430 & s1_sbox_in[2]) ^ (s1_n_430 | s2_sbox_in[2]); 

//  INVD1 g11484(.I (n_200), .ZN (n_137));  
assign s1_n_137 = ~s1_n_200; 
assign s2_n_137 = s2_n_200; 

//  ND2D1 g11550__1666(.A1 (n_377), .A2 (n_44), .ZN (n_159));  
assign s1_n_159 = ~(s1_n_377 & s1_n_44) ^ (s1_n_377 & s2_n_44); 
assign s2_n_159 = (s2_n_377 & s1_n_44) ^ (s2_n_377 & s2_n_44); 

//  INVD1 g11529(.I (n_226), .ZN (n_146));  
assign s1_n_146 = ~s1_n_226; 
assign s2_n_146 = s2_n_226; 

//  INVD1 g11480(.I (n_43), .ZN (n_145));  
assign s1_n_145 = ~s1_n_43; 
assign s2_n_145 = s2_n_43; 

//  INVD1 g11485(.I (n_91), .ZN (n_217));  
assign s1_n_217 = ~s1_n_91; 
assign s2_n_217 = s2_n_91; 

//  ND2D1 g11378__7410(.A1 (n_73), .A2 (n_374), .ZN (n_42));  
assign s1_n_42 = ~(s1_n_73 & s1_n_374) ^ (s1_n_73 & s2_n_374); 
assign s2_n_42 = (s2_n_73 & s1_n_374) ^ (s2_n_73 & s2_n_374); 

//  ND2D1 g11373__6417(.A1 (n_45), .A2 (n_374), .ZN (n_41));  
assign s1_n_41 = ~(s1_n_45 & s1_n_374) ^ (s1_n_45 & s2_n_374); 
assign s2_n_41 = (s2_n_45 & s1_n_374) ^ (s2_n_45 & s2_n_374); 

//  NR2XD0 g11361__5477(.A1 (n_45), .A2 (n_51), .ZN (n_40));  
assign s1_n_40 = ~(s2_n_45 | s1_n_51) ^ (s2_n_45 & s2_n_51); 
assign s2_n_40 = (s1_n_45 & s1_n_51) ^ (s1_n_45 | s2_n_51); 

//  INVD1 g11477(.I (n_563), .ZN (n_39));  
assign s1_n_39 = ~s1_n_563; 
assign s2_n_39 = s2_n_563; 

//  ND2D1 g11489__2398(.A1 (n_410), .A2 (n_147), .ZN (n_38));  
assign s1_n_38 = ~(s1_n_410 & s1_n_147) ^ (s1_n_410 & s2_n_147); 
assign s2_n_38 = (s2_n_410 & s1_n_147) ^ (s2_n_410 & s2_n_147); 

//  NR2D1 g11490__5107(.A1 (n_430), .A2 (n_4), .ZN (n_37));  
assign s1_n_37 = ~(s2_n_430 | s1_n_4) ^ (s2_n_430 & s2_n_4); 
assign s2_n_37 = (s1_n_430 & s1_n_4) ^ (s1_n_430 | s2_n_4); 

//  NR2XD0 g11377__6260(.A1 (n_73), .A2 (n_455), .ZN (n_36));  
assign s1_n_36 = ~(s2_n_73 | s1_n_455) ^ (s2_n_73 & s2_n_455); 
assign s2_n_36 = (s1_n_73 & s1_n_455) ^ (s1_n_73 | s2_n_455); 

//  NR2D1 g11530__4319(.A1 (n_381), .A2 (n_34), .ZN (n_35));  
assign s1_n_35 = ~(s2_n_381 | s1_n_34) ^ (s2_n_381 & s2_n_34); 
assign s2_n_35 = (s1_n_381 & s1_n_34) ^ (s1_n_381 | s2_n_34); 

//  ND2D1 g11535__8428(.A1 (n_44), .A2 (n_34), .ZN (n_33));  
assign s1_n_33 = ~(s1_n_44 & s1_n_34) ^ (s1_n_44 & s2_n_34); 
assign s2_n_33 = (s2_n_44 & s1_n_34) ^ (s2_n_44 & s2_n_34); 

//  NR2D1 g11540__5526(.A1 (n_381), .A2 (n_29), .ZN (n_32));  
assign s1_n_32 = ~(s2_n_381 | s1_n_29) ^ (s2_n_381 & s2_n_29); 
assign s2_n_32 = (s1_n_381 & s1_n_29) ^ (s1_n_381 | s2_n_29); 

//  INVD1 g11479(.I (n_31), .ZN (n_154));  
assign s1_n_154 = ~s1_n_31; 
assign s2_n_154 = s2_n_31; 

//  ND2D1 g11401__6783(.A1 (n_61), .A2 (n_150), .ZN (n_60));  
assign s1_n_60 = ~(s1_n_61 & s1_n_150) ^ (s1_n_61 & s2_n_150); 
assign s2_n_60 = (s2_n_61 & s1_n_150) ^ (s2_n_61 & s2_n_150); 

//  NR2XD0 g11460__3680(.A1 (n_45), .A2 (n_30), .ZN (n_172));  
assign s1_n_172 = ~(s2_n_45 | s1_n_30) ^ (s2_n_45 & s2_n_30); 
assign s2_n_172 = (s1_n_45 & s1_n_30) ^ (s1_n_45 | s2_n_30); 

//  INVD1 g11523(.I (n_74), .ZN (n_109));  
assign s1_n_109 = ~s1_n_74; 
assign s2_n_109 = s2_n_74; 

//  ND2D1 g11544__1617(.A1 (n_377), .A2 (n_28), .ZN (n_551));  
assign s1_n_551 = ~(s1_n_377 & s1_n_28) ^ (s1_n_377 & s2_n_28); 
assign s2_n_551 = (s2_n_377 & s1_n_28) ^ (s2_n_377 & s2_n_28); 

//  NR2XD0 g11508__2802(.A1 (n_671), .A2 (sbox_in[4]), .ZN (n_611));  
assign s1_n_611 = ~(s2_n_671 | s1_sbox_in[4]) ^ (s2_n_671 & s2_sbox_in[4]); 
assign s2_n_611 = (s1_n_671 & s1_sbox_in[4]) ^ (s1_n_671 | s2_sbox_in[4]); 

//  INVD1 g11522(.I (n_81), .ZN (n_143));  
assign s1_n_143 = ~s1_n_81; 
assign s2_n_143 = s2_n_81; 

//  NR2XD0 g11500__1705(.A1 (n_596), .A2 (sbox_in[4]), .ZN (n_663));  
assign s1_n_663 = ~(s2_n_596 | s1_sbox_in[4]) ^ (s2_n_596 & s2_sbox_in[4]); 
assign s2_n_663 = (s1_n_596 & s1_sbox_in[4]) ^ (s1_n_596 | s2_sbox_in[4]); 

//  ND2D1 g11548__5122(.A1 (n_29), .A2 (n_28), .ZN (n_134));  
assign s1_n_134 = ~(s1_n_29 & s1_n_28) ^ (s1_n_29 & s2_n_28); 
assign s2_n_134 = (s2_n_29 & s1_n_28) ^ (s2_n_29 & s2_n_28); 

//  INVD1 g11528(.I (n_100), .ZN (n_140));  
assign s1_n_140 = ~s1_n_100; 
assign s2_n_140 = s2_n_100; 

//  INVD1 g11525(.I (n_98), .ZN (n_112));  
assign s1_n_112 = ~s1_n_98; 
assign s2_n_112 = s2_n_98; 

//  NR2XD0 g11552__8246(.A1 (n_428), .A2 (n_671), .ZN (n_317));  
assign s1_n_317 = ~(s2_n_428 | s1_n_671) ^ (s2_n_428 & s2_n_671); 
assign s2_n_317 = (s1_n_428 & s1_n_671) ^ (s1_n_428 | s2_n_671); 

//  ND2D1 g11553__7098(.A1 (n_61), .A2 (n_102), .ZN (n_126));  
assign s1_n_126 = ~(s1_n_61 & s1_n_102) ^ (s1_n_61 & s2_n_102); 
assign s2_n_126 = (s2_n_61 & s1_n_102) ^ (s2_n_61 & s2_n_102); 

//  INVD1 g11524(.I (n_92), .ZN (n_148));  
assign s1_n_148 = ~s1_n_92; 
assign s2_n_148 = s2_n_92; 

//  ND2D1 g11558__6131(.A1 (n_27), .A2 (n_59), .ZN (n_149));  
assign s1_n_149 = ~(s1_n_27 & s1_n_59) ^ (s1_n_27 & s2_n_59); 
assign s2_n_149 = (s2_n_27 & s1_n_59) ^ (s2_n_27 & s2_n_59); 

//  OR2D1 g11536__1881(.A1 (n_120), .A2 (sbox_in[7]), .Z (n_26));  
assign s1_n_26 = (s2_n_120 | s1_sbox_in[7]) ^ (s2_n_120 & s2_sbox_in[7]); 
assign s2_n_26 = (s1_n_120 & s1_sbox_in[7]) ^ (s1_n_120 | s2_sbox_in[7]); 

//  INVD1 g11481(.I (n_45), .ZN (n_25));  
assign s1_n_25 = ~s1_n_45; 
assign s2_n_25 = s2_n_45; 

//  NR2D1 g11493__5115(.A1 (n_381), .A2 (n_315), .ZN (n_24));  
assign s1_n_24 = ~(s2_n_381 | s1_n_315) ^ (s2_n_381 & s2_n_315); 
assign s2_n_24 = (s1_n_381 & s1_n_315) ^ (s1_n_381 | s2_n_315); 

//  ND2D1 g11538__7482(.A1 (n_399), .A2 (n_129), .ZN (n_23));  
assign s1_n_23 = ~(s1_n_399 & s1_n_129) ^ (s1_n_399 & s2_n_129); 
assign s2_n_23 = (s2_n_399 & s1_n_129) ^ (s2_n_399 & s2_n_129); 

//  INVD1 g11483(.I (n_73), .ZN (n_22));  
assign s1_n_22 = ~s1_n_73; 
assign s2_n_22 = s2_n_73; 

//  NR2XD0 g11533__4733(.A1 (n_381), .A2 (n_184), .ZN (n_21));  
assign s1_n_21 = ~(s2_n_381 | s1_n_184) ^ (s2_n_381 & s2_n_184); 
assign s2_n_21 = (s1_n_381 & s1_n_184) ^ (s1_n_381 | s2_n_184); 

//  ND2D1 g11491__6161(.A1 (n_2), .A2 (n_374), .ZN (n_20));  
assign s1_n_20 = ~(s1_n_2 & s1_n_374) ^ (s1_n_2 & s2_n_374); 
assign s2_n_20 = (s2_n_2 & s1_n_374) ^ (s2_n_2 & s2_n_374); 

//  ND2D1 g11546__9315(.A1 (n_399), .A2 (n_19), .ZN (n_474));  
assign s1_n_474 = ~(s1_n_399 & s1_n_19) ^ (s1_n_399 & s2_n_19); 
assign s2_n_474 = (s2_n_399 & s1_n_19) ^ (s2_n_399 & s2_n_19); 

//  ND2D1 g11510__9945(.A1 (n_54), .A2 (sbox_in[7]), .ZN (n_43));  
assign s1_n_43 = ~(s1_n_54 & s1_sbox_in[7]) ^ (s1_n_54 & s2_sbox_in[7]); 
assign s2_n_43 = (s2_n_54 & s1_sbox_in[7]) ^ (s2_n_54 & s2_sbox_in[7]); 

//  INVD1 g11478(.I (n_18), .ZN (n_544));  
assign s1_n_544 = ~s1_n_18; 
assign s2_n_544 = s2_n_18; 

//  ND2D1 g11549__2883(.A1 (n_399), .A2 (n_44), .ZN (n_103));  
assign s1_n_103 = ~(s1_n_399 & s1_n_44) ^ (s1_n_399 & s2_n_44); 
assign s2_n_103 = (s2_n_399 & s1_n_44) ^ (s2_n_399 & s2_n_44); 

//  ND2D1 g11503__2346(.A1 (n_44), .A2 (sbox_in[4]), .ZN (n_696));  
assign s1_n_696 = ~(s1_n_44 & s1_sbox_in[4]) ^ (s1_n_44 & s2_sbox_in[4]); 
assign s2_n_696 = (s2_n_44 & s1_sbox_in[4]) ^ (s2_n_44 & s2_sbox_in[4]); 

//  ND2D1 g11502__1666(.A1 (n_651), .A2 (sbox_in[4]), .ZN (n_614));  
assign s1_n_614 = ~(s1_n_651 & s1_sbox_in[4]) ^ (s1_n_651 & s2_sbox_in[4]); 
assign s2_n_614 = (s2_n_651 & s1_sbox_in[4]) ^ (s2_n_651 & s2_sbox_in[4]); 

//  NR2XD0 g11507__7410(.A1 (n_428), .A2 (sbox_in[2]), .ZN (n_346));  
assign s1_n_346 = ~(s2_n_428 | s1_sbox_in[2]) ^ (s2_n_428 & s2_sbox_in[2]); 
assign s2_n_346 = (s1_n_428 & s1_sbox_in[2]) ^ (s1_n_428 | s2_sbox_in[2]); 

//  ND2D1 g11551__6417(.A1 (n_44), .A2 (n_374), .ZN (n_284));  
assign s1_n_284 = ~(s1_n_44 & s1_n_374) ^ (s1_n_44 & s2_n_374); 
assign s2_n_284 = (s2_n_44 & s1_n_374) ^ (s2_n_44 & s2_n_374); 

//  INVD1 g11486(.I (n_232), .ZN (n_85));  
assign s1_n_85 = ~s1_n_232; 
assign s2_n_85 = s2_n_232; 

//  NR2D1 g11554__5477(.A1 (n_17), .A2 (n_59), .ZN (n_81));  
assign s1_n_81 = ~(s2_n_17 | s1_n_59) ^ (s2_n_17 & s2_n_59); 
assign s2_n_81 = (s1_n_17 & s1_n_59) ^ (s1_n_17 | s2_n_59); 

//  ND2D1 g11559__2398(.A1 (n_17), .A2 (n_59), .ZN (n_558));  
assign s1_n_558 = ~(s1_n_17 & s1_n_59) ^ (s1_n_17 & s2_n_59); 
assign s2_n_558 = (s2_n_17 & s1_n_59) ^ (s2_n_17 & s2_n_59); 

//  NR2XD0 g11561__5107(.A1 (n_19), .A2 (sbox_in[7]), .ZN (n_226));  
assign s1_n_226 = ~(s2_n_19 | s1_sbox_in[7]) ^ (s2_n_19 & s2_sbox_in[7]); 
assign s2_n_226 = (s1_n_19 & s1_sbox_in[7]) ^ (s1_n_19 | s2_sbox_in[7]); 

//  NR2XD0 g11543__6260(.A1 (n_428), .A2 (n_28), .ZN (n_16));  
assign s1_n_16 = ~(s2_n_428 | s1_n_28) ^ (s2_n_428 & s2_n_28); 
assign s2_n_16 = (s1_n_428 & s1_n_28) ^ (s1_n_428 | s2_n_28); 

//  ND2D1 g11492__4319(.A1 (n_374), .A2 (sbox_in[0]), .ZN (n_15));  
assign s1_n_15 = ~(s1_n_374 & s1_sbox_in[0]) ^ (s1_n_374 & s2_sbox_in[0]); 
assign s2_n_15 = (s2_n_374 & s1_sbox_in[0]) ^ (s2_n_374 & s2_sbox_in[0]); 

//  INVD1 g11482(.I (n_150), .ZN (n_14));  
assign s1_n_14 = ~s1_n_150; 
assign s2_n_14 = s2_n_150; 

//  ND2D1 g11495__8428(.A1 (n_399), .A2 (n_54), .ZN (n_13));  
assign s1_n_13 = ~(s1_n_399 & s1_n_54) ^ (s1_n_399 & s2_n_54); 
assign s2_n_13 = (s2_n_399 & s1_n_54) ^ (s2_n_399 & s2_n_54); 

//  ND2D1 g11496__5526(.A1 (n_28), .A2 (n_315), .ZN (n_12));  
assign s1_n_12 = ~(s1_n_28 & s1_n_315) ^ (s1_n_28 & s2_n_315); 
assign s2_n_12 = (s2_n_28 & s1_n_315) ^ (s2_n_28 & s2_n_315); 

//  ND2D1 g11542__6783(.A1 (n_374), .A2 (sbox_in[7]), .ZN (n_11));  
assign s1_n_11 = ~(s1_n_374 & s1_sbox_in[7]) ^ (s1_n_374 & s2_sbox_in[7]); 
assign s2_n_11 = (s2_n_374 & s1_sbox_in[7]) ^ (s2_n_374 & s2_sbox_in[7]); 

//  ND2D1 g11532__3680(.A1 (n_399), .A2 (n_17), .ZN (n_10));  
assign s1_n_10 = ~(s1_n_399 & s1_n_17) ^ (s1_n_399 & s2_n_17); 
assign s2_n_10 = (s2_n_399 & s1_n_17) ^ (s2_n_399 & s2_n_17); 

//  INVD1 g11476(.I (n_9), .ZN (n_606));  
assign s1_n_606 = ~s1_n_9; 
assign s2_n_606 = s2_n_9; 

//  NR2D0 g11547__1617(.A1 (n_399), .A2 (n_374), .ZN (n_223));  
assign s1_n_223 = ~(s2_n_399 | s1_n_374) ^ (s2_n_399 & s2_n_374); 
assign s2_n_223 = (s1_n_399 & s1_n_374) ^ (s1_n_399 | s2_n_374); 

//  NR2D1 g11506__2802(.A1 (n_8), .A2 (n_147), .ZN (n_31));  
assign s1_n_31 = ~(s2_n_8 | s1_n_147) ^ (s2_n_8 & s2_n_147); 
assign s2_n_31 = (s1_n_8 & s1_n_147) ^ (s1_n_8 | s2_n_147); 

//  NR2XD0 g11499__1705(.A1 (n_594), .A2 (sbox_in[4]), .ZN (n_563));  
assign s1_n_563 = ~(s2_n_594 | s1_sbox_in[4]) ^ (s2_n_594 & s2_sbox_in[4]); 
assign s2_n_563 = (s1_n_594 & s1_sbox_in[4]) ^ (s1_n_594 | s2_sbox_in[4]); 

//  ND2D1 g11556__5122(.A1 (n_17), .A2 (sbox_in[7]), .ZN (n_92));  
assign s1_n_92 = ~(s1_n_17 & s1_sbox_in[7]) ^ (s1_n_17 & s2_sbox_in[7]); 
assign s2_n_92 = (s2_n_17 & s1_sbox_in[7]) ^ (s2_n_17 & s2_sbox_in[7]); 

//  NR2D1 g11509__8246(.A1 (n_54), .A2 (sbox_in[7]), .ZN (n_78));  
assign s1_n_78 = ~(s2_n_54 | s1_sbox_in[7]) ^ (s2_n_54 & s2_sbox_in[7]); 
assign s2_n_78 = (s1_n_54 & s1_sbox_in[7]) ^ (s1_n_54 | s2_sbox_in[7]); 

//  ND2D1 g11557__7098(.A1 (n_19), .A2 (sbox_in[7]), .ZN (n_98));  
assign s1_n_98 = ~(s1_n_19 & s1_sbox_in[7]) ^ (s1_n_19 & s2_sbox_in[7]); 
assign s2_n_98 = (s2_n_19 & s1_sbox_in[7]) ^ (s2_n_19 & s2_sbox_in[7]); 

//  ND2D1 g11516__6131(.A1 (n_54), .A2 (n_59), .ZN (n_91));  
assign s1_n_91 = ~(s1_n_54 & s1_n_59) ^ (s1_n_54 & s2_n_59); 
assign s2_n_91 = (s2_n_54 & s1_n_59) ^ (s2_n_54 & s2_n_59); 

//  NR2XD0 g11512__1881(.A1 (n_54), .A2 (n_6), .ZN (n_64));  
assign s1_n_64 = ~(s2_n_54 | s1_n_6) ^ (s2_n_54 & s2_n_6); 
assign s2_n_64 = (s1_n_54 & s1_n_6) ^ (s1_n_54 | s2_n_6); 

//  NR2XD0 g11555__5115(.A1 (n_19), .A2 (n_59), .ZN (n_74));  
assign s1_n_74 = ~(s2_n_19 | s1_n_59) ^ (s2_n_19 & s2_n_59); 
assign s2_n_74 = (s1_n_19 & s1_n_59) ^ (s1_n_19 | s2_n_59); 

//  NR2XD0 g11515__7482(.A1 (n_3), .A2 (sbox_in[7]), .ZN (n_200));  
assign s1_n_200 = ~(s2_n_3 | s1_sbox_in[7]) ^ (s2_n_3 & s2_sbox_in[7]); 
assign s2_n_200 = (s1_n_3 & s1_sbox_in[7]) ^ (s1_n_3 | s2_sbox_in[7]); 

//  ND2D1 g11560__4733(.A1 (n_19), .A2 (n_59), .ZN (n_100));  
assign s1_n_100 = ~(s1_n_19 & s1_n_59) ^ (s1_n_19 & s2_n_59); 
assign s2_n_100 = (s2_n_19 & s1_n_59) ^ (s2_n_19 & s2_n_59); 

//  ND2D1 g11539__6161(.A1 (n_399), .A2 (sbox_in[7]), .ZN (n_7));  
assign s1_n_7 = ~(s1_n_399 & s1_sbox_in[7]) ^ (s1_n_399 & s2_sbox_in[7]); 
assign s2_n_7 = (s2_n_399 & s1_sbox_in[7]) ^ (s2_n_399 & s2_sbox_in[7]); 

//  INVD1 g11581(.I (n_17), .ZN (n_27));  
assign s1_n_27 = ~s1_n_17; 
assign s2_n_27 = s2_n_17; 

//  INVD1 g11583(.I (n_61), .ZN (n_34));  
assign s1_n_34 = ~s1_n_61; 
assign s2_n_34 = s2_n_61; 

//  INVD1 g11584(.I (n_594), .ZN (n_680));  
assign s1_n_680 = ~s1_n_594; 
assign s2_n_680 = s2_n_594; 

//  NR2D0 g11511__9315(.A1 (n_6), .A2 (n_59), .ZN (n_45));  
assign s1_n_45 = ~(s2_n_6 | s1_n_59) ^ (s2_n_6 & s2_n_59); 
assign s2_n_45 = (s1_n_6 & s1_n_59) ^ (s1_n_6 | s2_n_59); 

//  ND2D1 g11517__9945(.A1 (n_6), .A2 (sbox_in[7]), .ZN (n_232));  
assign s1_n_232 = ~(s1_n_6 & s1_sbox_in[7]) ^ (s1_n_6 & s2_sbox_in[7]); 
assign s2_n_232 = (s2_n_6 & s1_sbox_in[7]) ^ (s2_n_6 & s2_sbox_in[7]); 

//  ND2D1 g11513__2883(.A1 (n_0), .A2 (sbox_in[7]), .ZN (n_150));  
assign s1_n_150 = ~(s1_n_0 & s1_sbox_in[7]) ^ (s1_n_0 & s2_sbox_in[7]); 
assign s2_n_150 = (s2_n_0 & s1_sbox_in[7]) ^ (s2_n_0 & s2_sbox_in[7]); 

//  INVD1 g11588(.I (n_428), .ZN (n_410));  
assign s1_n_410 = ~s1_n_428; 
assign s2_n_410 = s2_n_428; 

//  INVD1 g11589(.I (n_381), .ZN (n_377));  
assign s1_n_377 = ~s1_n_381; 
assign s2_n_377 = s2_n_381; 

//  ND2D1 g11488__2346(.A1 (n_399), .A2 (n_51), .ZN (n_5));  
assign s1_n_5 = ~(s1_n_399 & s1_n_51) ^ (s1_n_399 & s2_n_51); 
assign s2_n_5 = (s2_n_399 & s1_n_51) ^ (s2_n_399 & s2_n_51); 

//  ND2D1 g11498__1666(.A1 (n_627), .A2 (n_753), .ZN (n_9));  
assign s1_n_9 = ~(s1_n_627 & s1_n_753) ^ (s1_n_627 & s2_n_753); 
assign s2_n_9 = (s2_n_627 & s1_n_753) ^ (s2_n_627 & s2_n_753); 

//  ND2D1 g11501__7410(.A1 (n_627), .A2 (sbox_in[4]), .ZN (n_18));  
assign s1_n_18 = ~(s1_n_627 & s1_sbox_in[4]) ^ (s1_n_627 & s2_sbox_in[4]); 
assign s2_n_18 = (s2_n_627 & s1_sbox_in[4]) ^ (s2_n_627 & s2_sbox_in[4]); 

//  INVD1 g11582(.I (n_28), .ZN (n_30));  
assign s1_n_30 = ~s1_n_28; 
assign s2_n_30 = s2_n_28; 

//  INVD1 g11587(.I (n_184), .ZN (n_29));  
assign s1_n_29 = ~s1_n_184; 
assign s2_n_29 = s2_n_184; 

//  INVD1 g11585(.I (n_44), .ZN (n_671));  
assign s1_n_671 = ~s1_n_44; 
assign s2_n_671 = s2_n_44; 

//  INVD1 g11568(.I (n_651), .ZN (n_596));  
assign s1_n_596 = ~s1_n_651; 
assign s2_n_596 = s2_n_651; 

//  INVD1 g11586(.I (n_129), .ZN (n_102));  
assign s1_n_102 = ~s1_n_129; 
assign s2_n_102 = s2_n_129; 

//  NR2D1 g11514__6417(.A1 (n_6), .A2 (sbox_in[7]), .ZN (n_73));  
assign s1_n_73 = ~(s2_n_6 | s1_sbox_in[7]) ^ (s2_n_6 & s2_sbox_in[7]); 
assign s2_n_73 = (s1_n_6 & s1_sbox_in[7]) ^ (s1_n_6 | s2_sbox_in[7]); 

//  INVD1 g11570(.I (n_374), .ZN (n_430));  
assign s1_n_430 = ~s1_n_374; 
assign s2_n_430 = s2_n_374; 

//  INVD1 g11565(.I (n_147), .ZN (n_4));  
assign s1_n_4 = ~s1_n_147; 
assign s2_n_4 = s2_n_147; 

//  INVD1 g11563(.I (n_6), .ZN (n_3));  
assign s1_n_3 = ~s1_n_6; 
assign s2_n_3 = s2_n_6; 

//  ND2D1 g11590__5477(.A1 (n_590), .A2 (sbox_in[5]), .ZN (n_120));  
assign s1_n_120 = ~(s1_n_590 & s1_sbox_in[5]) ^ (s1_n_590 & s2_sbox_in[5]); 
assign s2_n_120 = (s2_n_590 & s1_sbox_in[5]) ^ (s2_n_590 & s2_sbox_in[5]); 

//  ND2D1 g11593__2398(.A1 (n_59), .A2 (sbox_in[0]), .ZN (n_28));  
assign s1_n_28 = ~(s1_n_59 & s1_sbox_in[0]) ^ (s1_n_59 & s2_sbox_in[0]); 
assign s2_n_28 = (s2_n_59 & s1_sbox_in[0]) ^ (s2_n_59 & s2_sbox_in[0]); 

//  NR2D1 g11592__5107(.A1 (n_1), .A2 (sbox_in[1]), .ZN (n_17));  
assign s1_n_17 = ~(s2_n_1 | s1_sbox_in[1]) ^ (s2_n_1 & s2_sbox_in[1]); 
assign s2_n_17 = (s1_n_1 & s1_sbox_in[1]) ^ (s1_n_1 | s2_sbox_in[1]); 

//  NR2XD0 g11597__6260(.A1 (n_59), .A2 (sbox_in[0]), .ZN (n_129));  
assign s1_n_129 = ~(s2_n_59 | s1_sbox_in[0]) ^ (s2_n_59 & s2_sbox_in[0]); 
assign s2_n_129 = (s1_n_59 & s1_sbox_in[0]) ^ (s1_n_59 | s2_sbox_in[0]); 

//  ND2D1 g11595__4319(.A1 (n_716), .A2 (sbox_in[2]), .ZN (n_594));  
assign s1_n_594 = ~(s1_n_716 & s1_sbox_in[2]) ^ (s1_n_716 & s2_sbox_in[2]); 
assign s2_n_594 = (s2_n_716 & s1_sbox_in[2]) ^ (s2_n_716 & s2_sbox_in[2]); 

//  NR2XD0 g11598__8428(.A1 (n_59), .A2 (sbox_in[1]), .ZN (n_184));  
assign s1_n_184 = ~(s2_n_59 | s1_sbox_in[1]) ^ (s2_n_59 & s2_sbox_in[1]); 
assign s2_n_184 = (s1_n_59 & s1_sbox_in[1]) ^ (s1_n_59 | s2_sbox_in[1]); 

//  INVD1 g11569(.I (n_399), .ZN (n_455));  
assign s1_n_455 = ~s1_n_399; 
assign s2_n_455 = s2_n_399; 

//  ND2D1 g11600__5526(.A1 (n_323), .A2 (sbox_in[5]), .ZN (n_381));  
assign s1_n_381 = ~(s1_n_323 & s1_sbox_in[5]) ^ (s1_n_323 & s2_sbox_in[5]); 
assign s2_n_381 = (s2_n_323 & s1_sbox_in[5]) ^ (s2_n_323 & s2_sbox_in[5]); 

//  INVD1 g11564(.I (n_315), .ZN (n_2));  
assign s1_n_2 = ~s1_n_315; 
assign s2_n_2 = s2_n_315; 

//  INVD1 g11562(.I (n_75), .ZN (n_8));  
assign s1_n_8 = ~s1_n_75; 
assign s2_n_8 = s2_n_75; 

//  INVD1 g11567(.I (n_627), .ZN (n_639));  
assign s1_n_639 = ~s1_n_627; 
assign s2_n_639 = s2_n_627; 

//  ND2D1 g11591__6783(.A1 (n_1), .A2 (sbox_in[1]), .ZN (n_19));  
assign s1_n_19 = ~(s1_n_1 & s1_sbox_in[1]) ^ (s1_n_1 & s2_sbox_in[1]); 
assign s2_n_19 = (s2_n_1 & s1_sbox_in[1]) ^ (s2_n_1 & s2_sbox_in[1]); 

//  NR2D1 g11578__3680(.A1 (n_590), .A2 (n_716), .ZN (n_651));  
assign s1_n_651 = ~(s2_n_590 | s1_n_716) ^ (s2_n_590 & s2_n_716); 
assign s2_n_651 = (s1_n_590 & s1_n_716) ^ (s1_n_590 | s2_n_716); 

//  ND2D1 g11594__1617(.A1 (n_59), .A2 (sbox_in[1]), .ZN (n_61));  
assign s1_n_61 = ~(s1_n_59 & s1_sbox_in[1]) ^ (s1_n_59 & s2_sbox_in[1]); 
assign s2_n_61 = (s2_n_59 & s1_sbox_in[1]) ^ (s2_n_59 & s2_sbox_in[1]); 

//  INVD1 g11566(.I (n_0), .ZN (n_54));  
assign s1_n_54 = ~s1_n_0; 
assign s2_n_54 = s2_n_0; 

//  NR2XD0 g11596__2802(.A1 (n_716), .A2 (sbox_in[2]), .ZN (n_44));  
assign s1_n_44 = ~(s2_n_716 | s1_sbox_in[2]) ^ (s2_n_716 & s2_sbox_in[2]); 
assign s2_n_44 = (s1_n_716 & s1_sbox_in[2]) ^ (s1_n_716 | s2_sbox_in[2]); 

//  ND2D1 g11599__1705(.A1 (n_406), .A2 (sbox_in[3]), .ZN (n_428));  
assign s1_n_428 = ~(s1_n_406 & s1_sbox_in[3]) ^ (s1_n_406 & s2_sbox_in[3]); 
assign s2_n_428 = (s2_n_406 & s1_sbox_in[3]) ^ (s2_n_406 & s2_sbox_in[3]); 

//  AN2XD1 g11580__5122(.A1 (n_323), .A2 (n_406), .Z (n_374));  
assign s1_n_374 = (s1_n_323 & s1_n_406) ^ (s1_n_323 & s2_n_406); 
assign s2_n_374 = (s2_n_323 & s1_n_406) ^ (s2_n_323 & s2_n_406); 

//  ND2D1 g11576__8246(.A1 (sbox_in[1]), .A2 (sbox_in[0]), .ZN (n_0));  
assign s1_n_0 = ~(s1_sbox_in[1] & s1_sbox_in[0]) ^ (s1_sbox_in[1] & s2_sbox_in[0]); 
assign s2_n_0 = (s2_sbox_in[1] & s1_sbox_in[0]) ^ (s2_sbox_in[1] & s2_sbox_in[0]); 

//  NR2D1 g11572__7098(.A1 (sbox_in[7]), .A2 (sbox_in[1]), .ZN (n_51));  
assign s1_n_51 = ~(s2_sbox_in[7] | s1_sbox_in[1]) ^ (s2_sbox_in[7] & s2_sbox_in[1]); 
assign s2_n_51 = (s1_sbox_in[7] & s1_sbox_in[1]) ^ (s1_sbox_in[7] | s2_sbox_in[1]); 

//  NR2D1 g11577__6131(.A1 (sbox_in[6]), .A2 (sbox_in[2]), .ZN (n_627));  
assign s1_n_627 = ~(s2_sbox_in[6] | s1_sbox_in[2]) ^ (s2_sbox_in[6] & s2_sbox_in[2]); 
assign s2_n_627 = (s1_sbox_in[6] & s1_sbox_in[2]) ^ (s1_sbox_in[6] | s2_sbox_in[2]); 

//  AN2XD1 g11579__1881(.A1 (sbox_in[5]), .A2 (sbox_in[3]), .Z (n_399));  
assign s1_n_399 = (s1_sbox_in[5] & s1_sbox_in[3]) ^ (s1_sbox_in[5] & s2_sbox_in[3]); 
assign s2_n_399 = (s2_sbox_in[5] & s1_sbox_in[3]) ^ (s2_sbox_in[5] & s2_sbox_in[3]); 

//  ND2D1 g11571__5115(.A1 (sbox_in[7]), .A2 (sbox_in[0]), .ZN (n_75));  
assign s1_n_75 = ~(s1_sbox_in[7] & s1_sbox_in[0]) ^ (s1_sbox_in[7] & s2_sbox_in[0]); 
assign s2_n_75 = (s2_sbox_in[7] & s1_sbox_in[0]) ^ (s2_sbox_in[7] & s2_sbox_in[0]); 

//  NR2XD0 g11573__7482(.A1 (sbox_in[1]), .A2 (sbox_in[0]), .ZN (n_6));  
assign s1_n_6 = ~(s2_sbox_in[1] | s1_sbox_in[0]) ^ (s2_sbox_in[1] & s2_sbox_in[0]); 
assign s2_n_6 = (s1_sbox_in[1] & s1_sbox_in[0]) ^ (s1_sbox_in[1] | s2_sbox_in[0]); 

//  ND2D1 g11574__4733(.A1 (sbox_in[7]), .A2 (sbox_in[1]), .ZN (n_315));  
assign s1_n_315 = ~(s1_sbox_in[7] & s1_sbox_in[1]) ^ (s1_sbox_in[7] & s2_sbox_in[1]); 
assign s2_n_315 = (s2_sbox_in[7] & s1_sbox_in[1]) ^ (s2_sbox_in[7] & s2_sbox_in[1]); 

//  NR2XD0 g11575__6161(.A1 (sbox_in[7]), .A2 (sbox_in[0]), .ZN (n_147));  
assign s1_n_147 = ~(s2_sbox_in[7] | s1_sbox_in[0]) ^ (s2_sbox_in[7] & s2_sbox_in[0]); 
assign s2_n_147 = (s1_sbox_in[7] & s1_sbox_in[0]) ^ (s1_sbox_in[7] | s2_sbox_in[0]); 

//  INVD1 g11606(.I (sbox_in[2]), .ZN (n_590));  
assign s1_n_590 = ~s1_sbox_in[2]; 
assign s2_n_590 = s2_sbox_in[2]; 

//  INVD1 g11601(.I (sbox_in[3]), .ZN (n_323));  
assign s1_n_323 = ~s1_sbox_in[3]; 
assign s2_n_323 = s2_sbox_in[3]; 

//  INVD1 g11607(.I (sbox_in[7]), .ZN (n_59));  
assign s1_n_59 = ~s1_sbox_in[7]; 
assign s2_n_59 = s2_sbox_in[7]; 

//  INVD1 g11604(.I (sbox_in[0]), .ZN (n_1));  
assign s1_n_1 = ~s1_sbox_in[0]; 
assign s2_n_1 = s2_sbox_in[0]; 

//  INVD1 g11602(.I (sbox_in[5]), .ZN (n_406));  
assign s1_n_406 = ~s1_sbox_in[5]; 
assign s2_n_406 = s2_sbox_in[5]; 

//  INVD1 g11603(.I (sbox_in[4]), .ZN (n_753));  
assign s1_n_753 = ~s1_sbox_in[4]; 
assign s2_n_753 = s2_sbox_in[4]; 

//  INVD1 g11605(.I (sbox_in[6]), .ZN (n_716));  
assign s1_n_716 = ~s1_sbox_in[6]; 
assign s2_n_716 = s2_sbox_in[6]; 

endmodule 
