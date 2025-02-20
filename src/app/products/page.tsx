import { Label } from "@radix-ui/react-label";

import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";




const ProductsPage = () => {
  return (
    <div className="flex flex-col items-center justify-center bg-black  border-rounded border-2 border-red-500 p-10">
      Products Page
      <Button>Botão do guguete</Button> 
      <Label className="text-red-500">Label do guguete</Label>
      <Input/>
    </div>
  );
};

export default ProductsPage;
