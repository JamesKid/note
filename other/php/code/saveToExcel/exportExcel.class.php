<?php
/**
 * Created by PhpStorm.
 */
class exportExcel
{
    const CELL_DATATYPE_STRING = 's';
    const CELL_DATATYPE_FORMULA = 'f';
    const CELL_DATATYPE_NUMERIC = 'n';
    const CELL_DATATYPE_BOOL = 'b';
    const CELL_DATATYPE_NULL = 's';
    const CELL_DATATYPE_INLINE = 'inlineStr';
    const MAX_ROW_NUM = 65536;

    /**
     * 创建人
     */
    public $excelCreator;

    /**
     * 标题
     */
    public $excelTitle;

    /**
     * 主题
     */
    public $excelSubject;

    /**
     * 描述
     */
    public $excelDescription;
    public $has_title = true;
    public $title = array();
    public $file_name;

    /**
     * 合并单元格
     */
    public $mergeCells = array();

    /**
     * 导出到Excel
     */
    public function export($data = array(), $cellDataType = array()) {
        if (!$data || count($data) > self::MAX_ROW_NUM) {
            return false;
        }
        //获得execl列
        $cells = $this->_getColumnNumber();

        $objPHPExcel = new PHPExcel();
        if ($this->excelCreator) {
            $objPHPExcel->getProperties()->setCreator($this->excelCreator); //创建人
            $objPHPExcel->getProperties()->setLastModifiedBy($this->excelCreator); //最后修改人
        }
        if ($this->excelTitle) {
            $objPHPExcel->getProperties()->setTitle($this->excelTitle); //标题
        }
        if ($this->excelSubject) {
            $objPHPExcel->getProperties()->setSubject($this->excelSubject); //主题
        }
        if ($this->excelDescription) {
            $objPHPExcel->getProperties()->setDescription($this->excelDescription); //描述
        }

        $objPHPExcel->setActiveSheetIndex(0);
        $objActSheet = $objPHPExcel->getActiveSheet();

        //第二维数组中元素下标
        $attrNames = array_keys(reset($data));
        //设置标题
        if ($this->has_title) {
            if ($this->title) {
                $title = $this->title;
            } else {
                $title = $attrNames;
            }
            $i = 0;
            foreach ($title as $attr) {
                $cell = $cells[$i] . '1';
                //				pf($cell."=>".$attr);
                $objActSheet->setCellValue($cell, $attr);
                $i++;
            }
            $rowStart = 1;
        } else {
            $rowStart = 0;
        }
        $colNo = 0;
        foreach ($attrNames as $attr) {
            $rowNo = $rowStart;
            $columnType = NULL;
            if (array_key_exists($attr, $cellDataType)) {
                $columnType = $cellDataType[$attr];
            }
            foreach ($data as $rowKey => $row) {
                $cell = $cells[$colNo] . ($rowNo + 1);
                //				pf($cell."=>".$data[$rowKey][$attr]);
                $cvalue = $data[$rowKey][$attr];
                if ($columnType) {
                    $objActSheet->setCellValueExplicit($cell, $cvalue, $columnType);
                } else {
                    $objActSheet->setCellValue($cell, $cvalue);
                }
                $rowNo++;
            }
            $colNo++;
        }
        if ($this->mergeCells) {
            foreach ($this->mergeCells as $value) {
                $objActSheet->mergeCells($value);
            }
        }

        if ($this->file_name) {
            $file_name = $this->file_name;
        } else {
            $file_name = date('YmdHis') . str_pad(mt_rand(0, 99), 2, 0, STR_PAD_LEFT);
        }
        $objWriter = new PHPExcel_Writer_Excel5($objPHPExcel);
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="' . $file_name . '.xls"');
        header('Cache-Control: max-age=0');
        $objWriter->save("php://output");
        exit;
    }
    /**
     * @param string $name       文件名
     * @param array $data_list  数据 数组
     * @param array $head_list  头部标题名 数组
     * @param string $title 底部标题
     * @throws Exception
     */
    public static function outputExcel($name,$data_list,$head_list,$title='') {
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()
            ->setTitle("数据EXCEL导出")
            ->setSubject("数据EXCEL导出")
            ->setDescription("备份数据")
            ->setKeywords("excel")
            ->setCategory("result file");
        $objPHPExcel->setActiveSheetIndex(0);
        $objActSheet1 = $objPHPExcel->getActiveSheet();
        if($title==''){
            $title = 'data';
        }
        $objActSheet1->setTitle($title);
        $total = count($data_list);
        $cell = array();
        if($total){
            $cell=self::sendCell(count($data_list[0]));
        }

        $num = 1;
        self::sendheadList($head_list,$cell,$num,$objActSheet1);
        self::sendDataList($data_list,$cell,$num,$objActSheet1);
        $objPHPExcel->setActiveSheetIndex(0);
        self::sendDowloadExcelHeader($name);
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output');
        exit;
    }

    /**
     *简单Excel数据导出
     *@param array $data 关联数组
     *@param string $name 文件名
     */
    public static function simpleExport($data,$name='') {
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()
            ->setTitle("数据EXCEL导出")
            ->setSubject("数据EXCEL导出")
            ->setDescription("备份数据")
            ->setKeywords("excel")
            ->setCategory("result file");
        $objPHPExcel->setActiveSheetIndex(0);
        $objActSheet1 = $objPHPExcel->getActiveSheet();
        $cell=self::sendCell(count($data[0]));
        $num = 1;
        if($name == ''){
            $name = date('Y-m-d',time());
        }
        if(count($data)>0){
            $fields_arr = array_keys($data[0]);
            self::sendheadList($fields_arr,$cell,$num,$objActSheet1);
        }
        self::sendDataList($data,$cell,$num,$objActSheet1);
        self::sendDowloadExcelHeader($name);
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output');
        exit;
    }

    /**
     * @param array $data 表格数据
     * @param string $name 表格名称
     * @param array $widths 表格相应列的宽度
     */
    public static function exportWithSetWidths($data, $name='', $widths = array()) {
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()
            ->setTitle("数据EXCEL导出")
            ->setSubject("数据EXCEL导出")
            ->setDescription("备份数据")
            ->setKeywords("excel")
            ->setCategory("result file");
        $objPHPExcel->setActiveSheetIndex(0);
        $objActSheet1 = $objPHPExcel->getActiveSheet();
        if(empty($widths) === false) {
            foreach($widths as $key => $values) {
                $objActSheet1->getColumnDimension($key)->setWidth($values);
            }
        }
        $cell=self::sendCell(count($data[0]));
        $num = 1;
        if($name == ''){
            $name = date('Y-m-d',time());
        }
        if(count($data)>0){
            $fields_arr = array_keys($data[0]);
            self::sendheadList($fields_arr,$cell,$num,$objActSheet1);
        }
        self::sendDataList($data,$cell,$num,$objActSheet1);
        self::sendDowloadExcelHeader($name);
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output');
    }

    /**
     * @param $name  string 文件名
     */
    private static function sendDowloadExcelHeader($name){
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="' . $name . '.xls"');
        header('Cache-Control: max-age=0');
    }

    /**
     * @param $num int $num 列数
     * @return array
     */
    private static function sendCell($num){
        $arr = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
        $brr = array_slice($arr,0,$num);
        return $brr;
    }

    //头部标题
    private static function sendheadList($head_list,$cell,$num,$objActSheet1){
        if(count($head_list)>0){
            foreach ($head_list as $k => $v) {
                $objActSheet1->setCellValue($cell[$k] . $num, $v);
            }
        }
    }

    //主体数据列表
    private static function sendDataList($data_list,$cell,$num,$objActSheet1){
        if(count($data_list)>0){
            $fields_arr = array_keys($data_list[0]);
            foreach ($data_list as $key => $value){
                $num += 1;
                foreach($fields_arr as $k=>$v){
                    $objActSheet1->setCellValue($cell[$k] . $num, $value[$v]);
                }
            }
        }
    }

    /**
     * @return array
     */
    private function _getColumnNumber() {
        $cells1 = range('A', 'Z');
        $cells2 = array();
        foreach ($cells1 as $value1) {
            foreach ($cells1 as $value2) {
                $cells2[] = $value1 . $value2;
                if ($value1 . $value2 == 'IV') {
                    break;
                }
            }
            if ($value1 == 'I') {
                break;
            }
        }
        $cells = array_merge($cells1, $cells2);
        return$cells;
    }
}
