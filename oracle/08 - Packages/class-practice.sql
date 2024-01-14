-- Practice Questions Based on Procedures & Functions

-- Create a procedure named PROD_ADD_SP that adds a row for a new product in BB_PRODUCT

--CREATE OR REPLACE PROCEDURE prod_add_sp
--  (
--  P_ID   IN bb_product.idproduct%TYPE,
--   p_name IN bb_product.productname%TYPE,
--   p_descrip IN bb_product.description%TYPE,
--   p_image IN bb_product.productimage%TYPE,
--   p_price IN bb_product.price%TYPE,
--   p_active IN bb_product.active%TYPE)
--  IS
--BEGIN
--  INSERT INTO bb_product (idproduct, productname, description,
--                          productimage, price, active)
--  VALUES (P_ID, p_name, p_descrip, p_image, p_price,
--          p_active);
--  COMMIT;
--END;


--
--BEGIN
--  prod_add_sp(19,'Roasted Blend','Well-balanced mix of roasted beans,
--              a medium body','roasted.jpg',2,1);
--END;
